#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

RED='\033[0;31m'
NC='\033[0m'

# Display the help and exit if "--help" or "-h" are the first command
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    printf "\n"
    printf "Display prs in a list that can be searched and opend.\n"
    printf "\n"
    printf "Required environment variables:\n"
    printf "    GITHUB_TOKEN:    your github token\n"
    printf "\n"
    printf "Syntax: prs [query ...]\n"
    printf "options:\n"
    printf "    query    query to run against the github api. Uses the github search syntax."
    printf "\n\n"
    exit 0
fi

if [[ "$GITHUB_TOKEN" == "" ]]; then
  printf "${RED}Environment variable \"GITHUB_TOKEN\" not found. Add 'export GITHUB_TOKEN=\"<your token here>\"' to your config file.${NC}\n"
  exit 1
fi

if ! [ -x "$(command -v jq)" ]; then
  printf "${RED}jq is not installed. Run 'brew install jq'.${NC}\n"
  exit 1
fi

# Pull the search query from the first parameter.
# This should be identical to any search query used in github's search
#
# Use: https://docs.github.com/en/github/searching-for-information-on-github/searching-issues-and-pull-requests
# for more info
SEARCH_QUERY="$1"

# Small utility to strip ansi color, pipe into to use
__stripcolor() {
  sed $'s,\x1b\\[[0-9;]*[a-zA-Z],,g'
}

# Defines the graphql query
# can be tested with: https://docs.github.com/en/graphql/overview/explorer
QUERY='query {
  search(query: \"<SEARCH_QUERY> is:pr\", type: ISSUE, first: 50) {
    edges {
      node {
        ... on PullRequest {
          title
          url
          repository {
            name
            owner {
              login
            }
          }
          commits(last: 1) {
            nodes {
              commit {
                status {
                  state
                  contexts {
                    state
                    context
                    targetUrl
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}'

# normalize the query and inject the search query env var
QUERY="$(echo $QUERY | sed "s/<SEARCH_QUERY>/$SEARCH_QUERY/g")"

# perform the curl request using the GITHUB_TOKEN
json=$(curl --silent \
   -H 'Content-Type: application/json' \
   -H "Authorization: bearer ${GITHUB_TOKEN}" \
   -X POST -d "{ \"query\": \"$QUERY\"}" https://api.github.com/graphql)

# parsedJson=$(cat $SCRIPT_DIR/.prs-cache.json)
parsedJson=$(echo $json | jq '
  [ .data.search.edges[] | {
    repo: .node.repository.name,
    owner: .node.repository.owner.login,
    title: .node.title,
    state: .node.commits.nodes[0].commit.status.state,
    checks: .node.commits.nodes[0].commit.status.contexts | sort_by(.context)
  } ]
')
echo $parsedJson > "$SCRIPT_DIR/.prs-cache.json"

# Use jq to parse, display, and colorize the query output 
items=$(echo $parsedJson | jq -c --raw-output '
  def colors: {
    "green": "\u001b[32m",
    "red": "\u001b[31m",
    "black": "\u001b[30;1m",
    "reset": "\u001b[0m",
  };

  to_entries | .[] | "\(.key) <del> \(colors.black)\(.value.owner)/\(.value.repo)\(colors.reset) \(.value.title) \(if .value.state == "FAILURE" then "\(colors.red)✖\(colors.reset)" else "\(colors.green)✔\(colors.reset)" end)"
')

# Pipe formatted query results to fzf for selection
selectedItem=$(
  echo "$items" \
  | fzf -i --ansi -d '<del>' --with-nth 2 --preview-window=down:7:wrap --preview "$SCRIPT_DIR/prs-detail.sh {1}"
)

if [ "$selectedItem" != "" ]; then
  # pull the line number that the selection was from
  lineNumber=$(echo "$items" | __stripcolor | grep -n "$selectedItem" | cut -f1 -d:)

  # using the orinigal data, get the url for the query response
  url=$(echo $json | jq --raw-output --argjson lineNumber "$lineNumber" '.data.search.edges[$lineNumber-1].node.url')

  # OSX only, open the url
  open "$url"
fi
