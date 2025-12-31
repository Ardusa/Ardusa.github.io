\ProvidesClass{resume}[12/17/2025 v7.0 Ankur's Resume Class]

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
	top=0.35in, % Top margin
	bottom=0.3in, % Bottom margin
	left=0.4in, % Left margin
	right=0.4in, % Right margin
	% showframe, % Uncomment to show how the type block is set on the page
}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\contact}[1]{\def\@contact{#1}}

\newcommand{\printname}{
	\begingroup
		\begin{center}
			{{\fontsize{24pt}{26pt}\selectfont\@name}}
		\end{center}
	\endgroup
}

\newcommand{\printcontact}{
	\begin{center}
		\def \\ {\hspace{0.5em}|\hspace{0.7em}}
		{\fontsize{11pt}{13pt}\selectfont\@contact}
	\end{center}
}

% Print name and contact at the top of the document automatically
\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{%
	\ori@document
	\printname
	\vspace{-0.25em}
	\printcontact
	\vspace{-0.25em}
}

% Defines the rSection environment for the major sections within the resume
\newenvironment{rSection}[2]{ % 2 Parameters: First letter, Section Title
	\MakeUppercase{
		\fontsize{14pt}{16pt}\selectfont #1
	}
	\hspace{-1.4em}
	\MakeUppercase{
		\fontsize{11pt}{13pt}\selectfont #2
	}
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

\newenvironment{rSectionEntry}[5]{ % 5 parameters: name, dates, position, technologies, location
	\textbf{\fontsize{12pt}{14pt}\selectfont #1}
	\ifthenelse{\equal{#4}{}}{}{
		\hspace{-0.9em}
		\textbf{\fontsize{15pt}{17pt} | }
		\hspace{-0.6em}
		\selectfont\textit #4
		\vspace{-1.2em}
	}
	\hfill {#2}
	\\
	\vspace{0.1em}
	\ifthenelse{\equal{#5}{}}{}{ % If the fifth parameter is empty, don't output parameters 3, 4, 5
		% \vspace{-1em}
		#3
		\ifthenelse{\equal{#4}{}}{}{
			\hspace{-0.9em}
			\textbf{\fontsize{15pt}{17pt} | }
			\hspace{-0.6em}
			\selectfont\textit #4
		}
		\hfill
		\selectfont\textit #5
	}
	\begin{list}{$\bullet\hspace{0.2em}$}{\leftmargin=2.5em}
		\setlength{\itemsep}{-0.6em} % Space between items
		\vspace{-0.7em} % Space right before the first item
}{
	\end{list}
	\vspace{-0.3em}
}

\newenvironment{rSet}[2] % 2 Parameters: title, items
{
	\noindent
	\begin{minipage}{\dimexpr\textwidth-1em\relax}
		{\fontsize{11.5pt}{13pt}\selectfont \textbf{#1}} \dotfill {\fontsize{11.5pt}{13pt}\selectfont #2}
	\end{minipage}
}{
}