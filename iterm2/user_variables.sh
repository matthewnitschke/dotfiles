# user variables that can be used in iterm2 python scripts
# Note: all will be in the user.<varname> context,  AND this file
#       must be sourced after the shell integration has been setup


# __relative_current_directory will return the current foldername. If we are in the 
# users current directory, it will display ~
__relative_current_directory() {
    if [[ $(pwd) == $HOME ]]; then
        echo "~"
    else
        DIR=$(basename "$(pwd)")
        echo $DIR
    fi
}

iterm2_print_user_vars() {
    # user.currentDirectory gets the current current directories name
    iterm2_set_user_var currentDirectory $(__relative_current_directory)
}