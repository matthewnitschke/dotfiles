\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{homework}

% Better fonts with accents
\RequirePackage[T1]{fontenc}

\renewcommand{\maketitle}{
    \begin{center}
        {\Large \@title } \\[7pt]

        \@author \\[3pt]

        {\footnotesize \today }
    \end{center}
}

% \newcommand{\question}[2]{
%     \noindent{\textbf{Question #1}}
%     \vspace{0.3em} \hrule \vspace{.3in}
%     \noindent{\textit{#2}}
%     \vspace{.15in}
% }

\newenvironment{question}[1]{
    \vspace{.2in}
    \noindent{\textbf{Question #1}}
    \vspace{0.3em} \hrule \vspace{.3in}
    \itshape
    % \noindent{\textit{
}{
    % }}
    \vspace{.15in}
}

\newenvironment{subquestions}[0]{%
  \begin{enumerate}
}{\end{enumerate}}

\newcommand{\subquestion}[1]{\item[\textbf{(#1)}]}