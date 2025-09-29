\ProvidesClass{resume}[09/28/2025 v5.0 Ankur's Resume Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\usepackage[parfill]{parskip}

\usepackage{array}

\usepackage{ifthen}

\usepackage{graphicx}

\usepackage{amsmath}

\pagestyle{empty}

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=0.5in, % Top margin
	bottom=0.5in, % Bottom margin
	left=0.5in, % Left margin
	right=0.5in, % Right margin
	% showframe, % Uncomment to show how the type block is set on the page
}

% Define \name and \address to store values in macros
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\address}[1]{\def\@address{#1}}

% Print the name in a large, bold, uppercase style
\newcommand{\printname}{
	\vspace{-0.3em}
	\begingroup
		\begin{center}
			{{\fontsize{30pt}{32pt}\selectfont\@name}}
		\end{center}
	\endgroup
	\vspace{-0.4em}
}

% Print the address, allowing for line breaks with \\ and diamond separators
\newcommand{\printaddress}{
	\vspace{-0.1em}
	\begin{center}
		\def \\ {$\hspace{0.5em}\diamond\hspace{0.5em}$}
		{{\fontsize{11pt}{13pt}\selectfont\@address}}
	\end{center}
	\vspace{-0.1em}
}

% Print name and address at the top of the document automatically
\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{%
	\ori@document
	\printname
	\printaddress
}

% Defines the rSection environment for the major sections within the resume
\newenvironment{rSection}[2]{ % 2 Parameters: First letter, Section Title
	% \vspace{-0.15em}
	\MakeUppercase{{\fontsize{16pt}{18pt}\selectfont #1}}$\hspace{0.05em}$\MakeUppercase{{\fontsize{11pt}{13pt}\selectfont #2}}
	\medskip
	\hrule
	\begin{list}{}{
		\setlength{\leftmargin}{1em}
	}
	\item[]
}{
	\end{list}
}

\newenvironment{rSectionEntry}[4]{ % 4 parameters: name of name of thing, dates, tagline, and location
	% \vspace{-0.1em}
	\textbf{\fontsize{12pt}{14pt}\selectfont #1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output parameters 3, 4
		\\
		{\fontsize{11.5pt}{13pt}\selectfont\textit{#3}} \hfill {\fontsize{11.5pt}{13pt}\selectfont\textit{#4}}
	}
	\begin{list}{$\hspace{1em}\bullet\hspace{0.2em}$}{\leftmargin=2.5em}
		\setlength{\itemsep}{-0.65em} \vspace{-0.7em} % Left is space between items, right is space before first item
}{
	\end{list}
	\vspace{-0.2em}
}

\newenvironment{rSectionEntryNoBullets}[4]{ % name, dates, tagline, location
    \noindent
    \textbf{\fontsize{12pt}{14pt}\selectfont #1} \hfill {#2} \par
    \ifthenelse{\equal{#3}{}}{}{
        \vspace{-0.6em}
        \noindent
        {\fontsize{11.5pt}{13pt}\selectfont \textit{#3}} \hfill {\fontsize{11.5pt}{13pt}\selectfont \textit{#4}} \par
    }
}{%
    \vspace{-0.2em}
}


\newenvironment{rSet}[2] % 2 Parameters: Set title, set items
{
	\noindent
	\begin{minipage}{\dimexpr\textwidth-1em\relax} % Subtract 1em from the width to compensate
		{\fontsize{11pt}{13pt}\selectfont \textbf{#1}} \dotfill {\fontsize{11pt}{13pt}\selectfont #2}
	\end{minipage}
}{}
