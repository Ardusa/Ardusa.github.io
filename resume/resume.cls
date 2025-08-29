\ProvidesClass{resume}[2025/08/29 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\usepackage[parfill]{parskip}

\usepackage{array}

\usepackage{ifthen}

\usepackage{graphicx}

\usepackage{amsmath}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=0.5in, % Top margin
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
\newcommand{\printaddress}[1]{
	\vspace{-1em}
	\begin{center}
		\def \\ {$\hspace{0.5em}\diamond\hspace{0.5em}$}
		#1
	\end{center}
	\vspace{0em}
}

% \printname is used to output the user's name in a large size
\newcommand{\printname}{
	\begingroup
		\hfil{\MakeUppercase{\huge\bfseries\name}}\hfil
		\break
	\endgroup
}

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
	\printname
	\printaddress{\@addressone}
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

\newenvironment{rSectionEntry}[4]{ % 4 parameters: name of name of thing, dates, tagline, and location
	\textbf{#1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output parameters 3, 4
		\\
		\textit{#3} \hfill \textit{#4}
	}
	\smallskip
	\begin{list}{$\bullet$\hspace{0.5em}}{\leftmargin=1.7em}
		\setlength{\itemsep}{-0.7em} \vspace{-0.8em}
}{
	\end{list}
	\vspace{-0.2em}
}

\newenvironment{rSet}[2] % 2 Parameters: Set title, set items
{
	\noindent
	\begin{minipage}{\textwidth}
		\textbf{#1} \dotfill {#2}
	\end{minipage}
}{}
