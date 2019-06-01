\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}
\LoadClass[10pt]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

% Publications
\RequirePackage[english]{babel}
\makeatletter
\renewcommand\@biblabel[1]{}
\makeatother
\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{
  \OLDthebibliography{#1}
  \setlength{\parskip}{2pt}
  \setlength{\itemsep}{0.5ex}
}

% Page margins
\RequirePackage[left=1.25in,right=0.75in,top=0.75in,bottom=0.75in]{geometry}

% Font
%\RequirePackage{fontspec}
%\setmainfont{Times New Roman}

% Section and Subsection Formatting
\RequirePackage{titlesec}
\usepackage{lipsum}% http://ctan.org/pkg/lipsum
\usepackage{everyshi}% http://ctan.org/pkg/everyshi
\usepackage{etoolbox}% http://ctan.org/pkg/etoolbox

%\newfontfamily\headingfont[Ligatures=TeX]{fonts/Cambria}
\titleformat{\section}{\scshape\MakeUppercase\bfseries}{}{0em}{}
\titleformat{\subsection}[runin]{\bfseries}{}{0em}{\gdef\@section@title@{\thesubsection\quad\@currentlabelname{}(cont'd)}}
\titlespacing*{\section}{-0.5in}{2ex}{0.5ex}
\titlespacing*{\subsection}{0pt}{3pt}{0pt}


% Page Numbering
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt} 
\fancyhf{}
\fancyhead[R]{\thepage /3}

% Paragraph Spacing and Indent
\setlength{\parindent}{0in}
%\setlength{\parskip}{1em}

% Hyphenation: disabled
\RequirePackage[none]{hyphenat}

% Lists: no indent, no spacing
\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=*, nolistsep}

% Name
\newcommand{\name}[1]{%
\begin{center}%
\begin{Huge}%
\textbf{#1}%
\end{Huge}%
\end{center}}

% Contact Information
\newenvironment{contact}
{\vspace{-0.25in}\begin{center}}
{\end{center}}

% Objective
\newcommand{\objective}[1]{\section{Objective}#1}

% Hyperlinks
\RequirePackage[linkcolor=black,citecolor=black,urlcolor=black,filecolor=black]{hyperref}

% \RequirePackage{import}
\newif\ifsplit