%% ProblemSetCUNY
%% Copyright 2022 Alex Washburn

\LoadClass[%
parskip=half,           % spacing value / method for paragraphs
chapterprefix=true,     % prefix for chapter marks
10pt,                   % font size
headings=normal,        % size of headings
bibliography=totoc,     % include bib in toc
listof=totoc,           % include listof entries in toc
listof=numberline,      % include listof entries in toc
listof=nochaptergap,
titlepage=on,           % own page for each title page
captions=tablebelow,    % display table captions above the float env
chapterprefix=false,    % do not display a prefix for chapters
appendixprefix=false,   % but display a prefix for appendix chapter
draft=false,            % value for draft version
toc=flat,
toc=numberline,
numbers=noenddot
]{scrreprt}%

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{ProblemSetCUNY}[2023/02/18 v1.2.1 A LaTeX style CUNY assignments]

\RequirePackage{lmodern}

\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}

\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}

\renewcommand*\familydefault{\sfdefault}

\RequirePackage{geometry}
\geometry{%
a4paper,
bottom=20mm,
left=20mm,
right=20mm,
top=20mm
}


%----------------------------- CUNY Assignment variables -------------------------
\global\let\VarAssignmentNumber\empty%
\global\let\VarCourseName\empty%
\global\let\VarCourseNumber\empty%
\global\let\VarDueDateDay\empty%
\global\let\VarDueDateMonth\empty%
\global\let\VarDueDateYear\empty%
\global\let\VarInstructorName\empty%
\global\let\VarStudentNumber\empty%

\global\let\VarAssignmentNumber\relax
\global\let\VarCourseName\relax
\global\let\VarCourseNumber\relax
\global\let\VarDueDateDay\relax%
\global\let\VarDueDateMonth\relax%
\global\let\VarDueDateYear\relax%
\global\let\VarInstructorName\relax
\global\let\VarStudentNumber\relax

\def\AssignmentNumber#1{\def\VarAssignmentNumber{#1}}
\def\CourseName#1{\def\VarCourseName{#1}}
\def\CourseNumber#1{\def\VarCourseNumber{#1}}
\def\DueDateDay#1{\def\VarDueDateDay{#1}}
\def\DueDateMonth#1{\def\VarDueDateMonth{#1}}
\def\DueDateYear#1{\def\VarDueDateYear{#1}}
\def\InstructorName#1{\def\VarInstructorName{#1}}
\def\StudentNumber#1{\def\VarStudentNumber{#1}}
%----------------------------- CUNY Assignment variables -------------------------


\RequirePackage[dvipsnames,svgnames,hyperref]{xcolor}
\KOMAoptions{twoside=false}

\DeclareTOCStyleEntry[beforeskip=-0.1in]{chapter}{chapter}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{section}{section}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsection}
\DeclareTOCStyleEntry[beforeskip=-0.1in]{default}{subsubsection}
%----------------------------- Setup table of contents -------------------------


%----------------------------- Modify style of page numbering  -------------------------
\addtokomafont{pagenumber}{\oldstylenums}
\addtokomafont{chapterentrypagenumber}{\oldstylenums}
\RedeclareSectionCommand[tocpagenumberformat=\oldstylenums]{section}
\RedeclareSectionCommand[tocpagenumberformat=\oldstylenums]{subsection}
%----------------------------- Modify style of page numbering -------------------------


%----------------------------- Modify paragraph format -------------------------
\newlength\savedparfillskip%
\newcommand*{\saveparfillskip}[1]{\setlength{\savedparfillskip}{\dimexpr\parfillskip\relax}}
\AddtoDoHook{heading/postinit/chapter}{\saveparfillskip}
\renewcommand{\chapterlinesformat}[3]{%
	\ctchaptertitle{#3}%
	#2%
	\hspace{-\savedparfillskip}%
}
\setlength{\abovedisplayskip}{1pt}
\setlength{\belowdisplayskip}{1pt}
\setlength{\abovedisplayshortskip}{1pt}
\setlength{\belowdisplayshortskip}{1pt}
%----------------------------- Modify paragraph format -------------------------


%----------------------------- Setup math modemodifications -------------------
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{nicefrac}
\PassOptionsToPackage{%
group-separator={,},
number-mode=text
}%
{siunitx}
\RequirePackage{siunitx}
\RequirePackage{xspace}

% Thin mono-spacing
\newcommand{\Code}[1]{%
{\fontfamily{lm}\fontseries{lc}\selectfont\texttt{\textsc{#1}}}\xspace%
}%

% Upgraded fraction representation
\let\oldfrac\frac% Store \frac
\renewcommand{\frac}[2]{%
\mathchoice%
{\oldfrac{#1}{#2}}% display style
{\nicefrac{#1}{#2}}% text style
{\nicefrac{#1}{#2}}% script style
{\nicefrac{#1}{#2}}% script-script style
}

% Number Categories
\newcommand{\Nats}{\ensuremath{\mathbb{N}}\xspace}
\newcommand{\Ints}{\ensuremath{\mathbb{Z}}\xspace}
\newcommand{\Rats}{\ensuremath{\mathbb{Q}}\xspace}

% Logical frameworks
\newcommand{\IntG}{\ensuremath{\textbf{IntG}}\xspace}
\newcommand{\Int}{\ensuremath{\textbf{Int}}\xspace}
\newcommand{\PL}{\ensuremath{\textbf{PL}}\xspace}
\newcommand{\CL}{\ensuremath{\textbf{CI}}\xspace}
\newcommand{\LP}{\ensuremath{\textbf{LP}}\xspace}
\newcommand{\J}{\ensuremath{\textbf{J}}\xspace}
\newcommand{\JFour}{\ensuremath{\textbf{J4}}\xspace}
\newcommand{\JMinus}{\ensuremath{\textbf{J}^{\textbf{---}}}\xspace}
\newcommand{\K}{\ensuremath{\textbf{K}}\xspace}
\newcommand{\KFour}{\ensuremath{\textbf{K4}}\xspace}
\newcommand{\LEA}{\ensuremath{\textbf{LEA}}\xspace}
\newcommand{\SFour}{\ensuremath{\textbf{S4}}\xspace}
\newcommand{\SFourG}{\ensuremath{\textbf{S4G}}\xspace}
\newcommand{\SFive}{\ensuremath{\textbf{S5}}\xspace}
\newcommand{\BHK}{\ensuremath{\textbf{BHK}}\xspace}


% Logical connectives
\newcommand{\ImpliesOne}{\ensuremath{\rightarrow}\xspace}
\newcommand{\ImpliesTwo}{\ensuremath{\implies}\xspace}
\newcommand{\ConverseOne}{\ensuremath{\longleftarrow}\xspace}
\newcommand{\ConverseTwo}{\ensuremath{\impliedby}\xspace}
\newcommand{\ModelsOne}{\ensuremath{\vdash}\xspace}
\newcommand{\ModelsTwo}{\ensuremath{\vDash}\xspace}
\newcommand{\Force}{\ensuremath{\vDash}\xspace}
\newcommand{\LBox}{\ensuremath{\square}\xspace}
\newcommand{\DBox}{\ensuremath{\boxdot}\xspace}
\newcommand{\LDiamond}{\ensuremath{\diamond}\xspace}
\newcommand{\LQED}{\ensuremath{\blacksquare\ \ \texttt{\textbf{Q\,E\,D}}}}
\newcommand{\World}[1]{\Code{\textit{w}}_{\Code{#1}}}
\newcommand{\TermOf}[2]{\ensuremath{#1\!\colon\!\!\!#2}\xspace}


\usepackage{amsmath,amssymb,graphicx}
\usepackage[outline]{contour}% http://ctan.org/pkg/contour
\contourlength{0.1pt}\contournumber{16}
\newcommand{\join}{\mathrel{\text{\raisebox{0.2ex}{\resizebox{3.2mm}{1.3mm}{\ensuremath{\contourlength{0.1pt}\contournumber{24}\boldsymbol{\wedge}}}}}}}
\newcommand{\meet}{\mathrel{\text{\raisebox{0.2ex}{\resizebox{3.2mm}{1.3mm}{\ensuremath{\contourlength{0.1pt}\contournumber{24}\boldsymbol{\vee}}}}}}}


% Groupings
\newcommand{\Brackets}[1]{\ensuremath{\left[\;#1\;\right]}\xspace}
\newcommand{\Parens}[1]{\ensuremath{\left(\;#1\;\right)}\xspace}
\newcommand{\SetNote}[1]{\ensuremath{\left\{\;#1\;\right\}}\xspace}
\newcommand{\IndexRange}[2]{\ensuremath{\texttt{{[}\,#1,\ #2\,{]}}}\xspace}
\newcommand{\NumericRange}[2]{\ensuremath{\left[\,#1,\; #2\,\right]}\xspace}

% Quantity styling
\newcommand{\Qty}[2]{\oldstylenums{\qty[number-mode=text]{#1}{#2}}}

%Asymtotic analysis
\newcommand{\BigO}[1]{\ensuremath{\mathcal{O}\left(\,#1\,\right)}\xspace}
\newcommand{\BigOmega}[1]{\ensuremath{\Omega\left(\,#1\,\right)}\xspace}
\newcommand{\BigTheta}[1]{\ensuremath{\Theta\left(\,#1\,\right)}\xspace}
%----------------------------- Setup math mode modifications -------------------


%----------------------------- Other packages ----------------------------------
\usepackage{setspace}
\usepackage{latexsym}

%----------------------------- Other packages ----------------------------------


%----------------------------- Update sectioning -------------------------------
\usepackage{longfbox}
\usepackage{changepage}

\renewcommand{\sectionlinesformat}[4]{%
\@tempswafalse
\Ifstr{#1}{section}{%
\begin{adjustwidth}{-17mm}{-17mm}%
\hspace*{#2}%
\begin{longfbox}[
border-width=1mm,
margin=0pt,
padding-top=6mm,
padding-right=16mm,
padding-left=16mm,
padding-bottom=6mm
]
\raggedsection#3~\\[2mm]\Large\textbf{#4}%
\end{longfbox}%
\end{adjustwidth}%
}{\@hangfrom{\hskip #2#3}{#4}}
}

\addtokomafont{disposition}{\normalfont}
\addtokomafont{part}{\scshape\LARGE}
\addtokomafont{chapter}{\scshape\Huge}
\addtokomafont{section}{\sffamily\bfseries\Large}
\addtokomafont{subsection}{\bfseries}
\addtokomafont{subsubsection}{\bfseries}
\addtokomafont{paragraph}{\normalfont}
\addtokomafont{subparagraph}{\normalfont}

\setcounter{secnumdepth}{3}
\renewcommand*{\thesection}{\LARGE\textsc{Problem}~\arabic{section}:}
\renewcommand*{\thesubsection}{\arabic{section}~(\alph{subsection})}
\renewcommand*{\thesubsubsection}{\thesubsection~---~\makebox[6mm][l]{\Roman{subsubsection}:}}
\RedeclareSectionCommands[beforeskip=-3ex,afterskip=2ex]{section,subsection,subsubsection}
%----------------------------- Update sectioning -------------------------------


%--------------------------------- Internal commands ---------------------------
\RequirePackage{csquotes}
\newcommand{\CourseTitle}{CSc~\VarCourseNumber~--~\VarCourseName}
\newcommand{\AssignmentTitle}{Problem~Set~\textnumero\VarAssignmentNumber}
\newcommand{\HomeworkText}[1]{\textbf{\enquote{\,#1\,}}}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
\parindent=0pt
\KOMAoptions{fontsize=12pt}
\begin{center}
\singlespacing%
~\vfill
\Huge\CourseTitle\\[1cm]
\AssignmentTitle\normalsize\\[1cm]
by\\[1cm]
\Large\VarInstructorName\normalsize\\[1cm]
Due at \textbf{\texttt{23:59}} on\\[1cm]
\Large\texttt{\VarDueDateYear}\;--\;\texttt{\VarDueDateMonth}\;--\;\texttt{\VarDueDateDay}\\[1cm]%
~\vfill
\end{center}
\KOMAoptions{fontsize=10pt}
}
%--------------------------------- Internal commands ---------------------------


%--------------------------------- Exported Commands ---------------------------
\usepackage{afterpage}
\newcommand{\CoverPage}{%
\begin{titlepage}
% Always use Arabic numbering, even in Front-matter
\setcounter{page}{1}
\pagenumbering{arabic}
\maketitle%
\doublespacing%
\end{titlepage}
}

\newcommand{\Problem}[1]{%
\clearpage%
\newgeometry{bottom=20mm,left=20mm,right=20mm,top=3mm}%
\section{#1}%
%\restoregeometry
}%

\newcommand{\SubProblem}[1]{\subsection{\hspace*{-2mm}:~\HomeworkText{#1}}}%

\newcommand{\SubSubProblem}[1]{\subsubsection{\HomeworkText{#1}}}%


\newcommand{\StartExtraCredit}{
\renewcommand*{\thesection}{\LARGE\textsc{Extra Credit}~\arabic{section}:}
}
