\ProvidesClass{resume}[09/11/2025 v3.0 Ankur's Resume Class]

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
	top=0.75in, % Top margin
	bottom=0.75in, % Bottom margin
	left=0.5in, % Left margin (reduced)
	right=0.5in, % Right margin (reduced)
	% showframe, % Uncomment to show how the type block is set on the page
}

% Define \name and \address to store values in macros
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\address}[1]{\def\@address{#1}}

% Print the name in a large, bold, uppercase style
\newcommand{\printname}{
	\vspace{0em}
	\begingroup
		\begin{center}
			{\MakeUppercase{\huge\bfseries\@name}}
		\end{center}
	\endgroup
	\vspace{0em}
}

% Print the address, allowing for line breaks with \\ and diamond separators
\newcommand{\printaddress}{
	\vspace{0em}
	\begin{center}
		\def \\ {$\hspace{0.5em}\diamond\hspace{0.5em}$}
		\@address
	\end{center}
	\vspace{0em}
}

% Print name and address at the top of the document automatically
\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{%
	\ori@document
	\printname
	\vspace{0em}
	\printaddress
}

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[2]{ % 2 Parameters: First letter, Section Title
	\MakeUppercase{\textbf{\fontsize{15pt}{17pt}\selectfont #1}}$\hspace{0.05em}$\MakeUppercase{\textbf{\fontsize{11pt}{13pt}\selectfont #2}}
	\medskip
	\hrule
	\begin{list}{}{
		\setlength{\leftmargin}{0.5em}
	}
	\item[]
}{
	\end{list}
}

\newenvironment{rSectionEntry}[4]{ % 4 parameters: name of name of thing, dates, tagline, and location
	\textbf{\fontsize{11pt}{13pt}\selectfont #1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output parameters 3, 4
		\\
		\textit{#3} \hfill \textit{#4}
	}
	\vspace{0em}
	\begin{list}{$\hspace{1em}\bullet\hspace{0.2em}$}{\leftmargin=2.5em}
		\setlength{\itemsep}{-0.7em} \vspace{-0.7em}
}{
	\end{list}
	\vspace{0.5em}
}

\newenvironment{rSet}[2] % 2 Parameters: Set title, set items
{
	\noindent
	\begin{minipage}{\textwidth}
		\textbf{#1} \dotfill {#2}
	\end{minipage}
}{}
