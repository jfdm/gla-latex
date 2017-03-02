% ----------------------------------------------------------- [ gla-letter.cls ]
% Module    : gla-letter.cls
% Copyright : (c) Jan de Muijnck-Hughes
% License   : see LICENSE
% Version   : v2016.03.09
% ---------------------------------------------------------------------- [ EOH ]
%%
%% This work may be distributed and/or modified under the  conditions
%% of the LaTeX Project Public License, either version 1.3c of this
%% license or (at your option) any later version.
%%
%% The latest version of this license can be found at:
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Jan de Muijnck-Hughes
%%
%% This work consists of the file: gla-letter.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gla-letter}[2016/03/09 v2016.03.09 gla-letter]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX class for writing letters, adhereing to the University of St
%% Andrews corporate guidelines.
\LoadClass[pdftex, 10pt, article, oneside, final]{memoir}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions
% ------------------------------------ [ Fix LaTex Packages ]
\RequirePackage[l2tabu,orthodox]{nag}
\RequirePackage{fixltx2e}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[british]{babel}
\RequirePackage[strict=true]{csquotes}
\RequirePackage[british,cleanlook]{isodate}
\RequirePackage{xspace}
\RequirePackage{environ}
\RequirePackage{relsize}
\RequirePackage[colorlinks=true]{hyperref}
% ----------------------------------------- [ Font PackageWithOptionss ]
\RequirePackage[sc]{mathpazo}
\RequirePackage{helvet}
\linespread{1.05}
\RequirePackage[protrusion=true, expansion=true]{microtype}
% ---------------------------------------- [ Style PackageWithOptionss ]
\RequirePackage[cmyk,usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{gla-colours}
%% ---------------------------------------------------------------- [ Commands ]

\newcommand{\department}[1]{\gdef\SOCS@department{#1}}
\newcommand{\address}[1]{\gdef\SOCS@address{#1}}
\newcommand{\jobtitle}[1]{\gdef\SOCS@jobtitle{#1}}
\newcommand{\email}[1]{\gdef\SOCS@email{#1}}
\newcommand{\logo}[1]{\gdef\SOCS@logo{#1}}
\newcommand{\tel}[1]{\gdef\SOCS@tel{#1}}

\newcommand{\emailTo}[1]{\href{mailto:#1}{#1}}

\newcommand{\charityline}{The University of Glasgow, charity number SC004401}

\newcommand{\recipient}[1]{\gdef\SOCS@recipient{#1}}
\newcommand{\opening}[1]{\gdef\SOCS@opening{#1}}
\newcommand{\closing}[1]{\gdef\SOCS@closing{#1}}

\newcommand{\subject}[1]{%
\vspace{-2em}\begin{center}\bfseries#1\end{center}}

%% -------------------------------------------------------------- [ Paper Size ]

\setulmarginsandblock{55mm}{50mm}{*}
\setlrmarginsandblock{14mm}{14mm}{*}

\setheadfoot{17mm}{30mm}
\setheaderspaces{7mm}{*}{*}
\checkandfixthelayout{}

% Paragraph Spacing
\setlength{\parskip}{1.75ex plus 0.2ex minus 0.42ex}
\setlength{\parindent}{0pt}

\fixpdflayout{}

%% ------------------------------------------------------- [ Header and Footer ]

\origdate{}

\hypersetup{%
  linkcolor=gla-blue,
  anchorcolor=gla-blue,
  citecolor=gla-blue,
  urlcolor=gla-blue
}
\makepagestyle{gla-frontpage}

\makeoddhead{gla-frontpage}{%
  \begin{flushleft}
  \includegraphics[width=55mm]{\SOCS@logo}
  \end{flushleft}
  \vspace*{5mm}
}{}{}

\makeevenhead{gla-frontpage}{}{}{}

\makeoddfoot{gla-frontpage}{\color{gla-blue}
  \sffamily{}\bfseries{}
  \begin{flushleft}
    \@author\\
    \SOCS@jobtitle{}\\
    \SOCS@address\\
    Tel:~\SOCS@tel\\
    Email:~\href{mailto:\SOCS@email}{\SOCS@email}~~%
    \href{https://www.glasgow.ac.uk}{www.glasgow.ac.uk}\\[0.2em]
\smaller\charityline\\
\end{flushleft}
}{}{}

\makepagestyle{gla-normalpage}
\copypagestyle{gla-normalpage}{gla-frontpage}
\makeoddhead{gla-normalpage}{}{Page-\thepage}{{\origdate\@date}}
\makeevenhead{gla-normalpage}{}{}{}
\pagestyle{gla-normalpage}

%% ------------------------------------------------------------- [ Letter Body ]
\NewEnviron{letter}{%
\thispagestyle{gla-frontpage}
\sffamily
\pagestyle{gla-normalpage}
\begin{raggedright}
\SOCS@recipient\\[1em]
Date:~{\@date}\\[1em]
\end{raggedright}
\SOCS@opening\newline
\BODY{}
\vspace{2em}
\SOCS@closing%
}

\endinput
% ---------------------------------------------------------------------- [ EOF ]
