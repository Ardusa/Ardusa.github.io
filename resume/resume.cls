\ProvidesClass{resume}[11/17/2025 v6.0 Ankur's Resume Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\usepackage[parfill]{parskip}

\usepackage{array}
\usepackage{ifthen}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{geometry} % Required for adjusting page dimensions and margins
\usepackage{fontspec}
\usepackage{hyperref}

\setmainfont[
  UprightFont    = cmunrm.otf,
  ItalicFont     = cmunti.otf,
  BoldFont       = cmunbx.otf,
  BoldItalicFont = cmunbi.otf
]{CMU Serif}

\pagestyle{empty}

\geometry{
	top=0.4in, % Top margin
	bottom=0.4in, % Bottom margin
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
			{{\fontsize{24pt}{26pt}\selectfont\@name}}
		\end{center}
	\endgroup
	\vspace{-0.4em}
}

% Print the address, allowing for line breaks with \\ and diamond separators
\newcommand{\printaddress}{
	\vspace{0em}
	\begin{center}
		\def \\ {$\hspace{0.5em}|\hspace{0.7em}$}
		{{\fontsize{11pt}{13pt}\selectfont\@address}}
	\end{center}
	\vspace{-0.2em}
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
	\MakeUppercase{{\fontsize{14pt}{16pt}\selectfont #1}}$\hspace{0.05em}$\MakeUppercase{{\fontsize{11pt}{13pt}\selectfont #2}}
	\vspace{0.3em}
	\hrule
	\vspace{-0.2em}
	\begin{list}{}{
		\setlength{\leftmargin}{1em}
	}
	\item[]
}{
	\end{list}
}

\newenvironment{rSectionEntry}[5]{ % 4 parameters: name of name of thing, dates, tagline, and location
	\textbf{\fontsize{12pt}{14pt}\selectfont #1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output parameters 3, 4
		\\
		{#3\ifthenelse{\equal{#4}{}}{}{ | \selectfont\textit{#4}}} \hfill {\selectfont\textit{#5}\hspace{0.35em}}
	}
	\begin{list}{$\hspace{1em}\bullet\hspace{0.2em}$}{\leftmargin=2.5em}
		\setlength{\itemsep}{-0.65em} \vspace{-0.7em} % Left is space between items, right is space before first item
}{
	\end{list}
	\vspace{-0.4em}
}

\newenvironment{rSet}[2] % 2 Parameters: Set title, set items
{
	\noindent
	\begin{minipage}{\dimexpr\textwidth-1em\relax} % Subtract 1em from the width to compensate
		{\fontsize{11.5pt}{13pt}\selectfont \textbf{#1}} \dotfill {\fontsize{11.5pt}{13pt}\selectfont #2}
	\end{minipage}
}{}
