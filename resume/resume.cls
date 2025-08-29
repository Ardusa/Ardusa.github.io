\ProvidesClass{resume}[2025/08/29 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{array} % Required for bold tabular columns

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{graphicx} % Required for including images

\usepackage{amsmath}

\pagestyle{empty} % Suppress headers and footers on all pages

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=0.6in, % Top margin
	bottom=0.4in, % Bottom margin
	left=0.5in, % Left margin (reduced)
	right=0.5in, % Right margin (reduced)
	% showframe, % Uncomment to show how the type block is set on the page
}

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Defines the \name command to set the user's name

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% The \address command is used to set the first, second and third address lines (the last 2 are optional)
\newcommand{\address}[1]{
	\@ifundefined{@addressone}{ % If the first address line has not been set yet, set it
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{ % If the second address line has not been set yet, set it
			\def \@addresstwo {#1}
		}{ % Otherwise, set the third address line
			\def \@addressthree {#1}
		}%
	}
}

% \printaddress is used to style an address line (provided in the single parameter to the command)
\newcommand{\printaddress}[3]{
	\vspace{-1.5em}
	\begin{center}
		\begin{tabular}{c}
			#1
		\end{tabular}
		\hspace{5em}
		\begin{tabular}{c}
			#2
		\end{tabular}
		\hspace{5em}
		\begin{tabular}{c}
			#3
		\end{tabular}
	\end{center}
	\vspace{0.25em}
}

% \printname is used to output the user's name in a large size
\newcommand{\printname}{
	\begingroup
		\hfil{\MakeUppercase{\huge\bfseries\name}}\hfil
		\bigskip\break
	\endgroup
}

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
	\printname
	\printaddress{\@addressone}{\@addresstwo}{\@addressthree}
}

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[1]{ % 1 Parameter: Section Title
	\MakeUppercase{\textbf{#1}}
	\medskip
	\hrule
	\begin{list}{}{
		\setlength{\leftmargin}{0em}
	}
	\item[]
}{
	\end{list}
}

\newenvironment{rSectionEntry}[4]{ % 4 parameters: name of institution/employer, year(s) employed/graduation date, job title/degree, and location
	\textbf{#1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output parameters 3, 4
		\\
		\textit{#3} \hfill \textit{#4}
	}
	\smallskip
	\begin{list}{$\bullet$}{\leftmargin=1.0909090909090908em}
		\setlength{\itemsep}{-0.45454545454545453em} \vspace{-0.8181818181818182em}
}{
	\end{list}
	\vspace{0.18181818181818182em}
}

\newenvironment{rSet}[2] % 2 Parameters: Set title, set items
{
	\noindent
	\begin{minipage}{\textwidth}
		\textbf{#1} \dotfill {#2}
	\end{minipage}
}{}
