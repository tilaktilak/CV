\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}


\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[Path=./fonts/]{HelveticaNeue}
\newfontfamily\thinfont[Path=./fonts/]{HelveticaNeue-UltraLight}
\newfontfamily\headingfont[Path=./fonts/]{HelveticaNeue-CondensedBold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Path=./fonts/, Mapping=tex-text, Color=textcolor]{HelveticaNeue-Light}

\setmathfont[Path=./fonts/]{XITSMath-Regular}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{20pt}{34pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{42pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1cm} % Ecart entre le texte de gauche et le haut de page
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{1.8\parskip} % Ecart entre les sections
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.2\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{12.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{0.5\parsep} % Ecart entre les points des listes du texte gauche
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\usepackage{graphicx}
\graphicspath{{./icons/}}

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm} % Distance du texte de droite par rapport au haut de page
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  %\begin{textblock}{3.6}(1.5, 4.33)
  \begin{textblock}{4.3}(1, 3.33) % n1 : , n2 : Décalage à droite du texte droit, n3 : semble inutile
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
%
%\DeclareFieldFormat[article]{title}{#1\par}
%\DeclareFieldFormat[book]{title}{#1\par}
%\DeclareFieldFormat[inproceedings]{title}{#1\par}
%\DeclareFieldFormat[misc]{title}{#1\par}
%\DeclareFieldFormat[report]{title}{#1\par}
%
%\DeclareBibliographyDriver{article}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \usebibmacro{journal+issuetitle}%
%    \setunit{\space}%
%    \printfield{pages}%
%    \newunit%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{book}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%
%\DeclareBibliographyDriver{inproceedings}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}%
%    \printfield{booktitle}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{misc}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{booktitle}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{report}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{type}%
%    \setunit{\space}%
%    \printfield{number}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{#3}{}{#3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}
%
%\newcommand{\printbibsection}[2]{
%  \begin{refsection}
%    \nocite{*}
%    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
%  \end{refsection}
%}
%
%\DeclareSortingScheme{chronological}{
%  \sort[direction=descending]{\field{year}}
%  \sort[direction=descending]{\field{month}}
%}
%


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2.3cm,right=0.8cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 0.5cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.3cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
    bubble center node color = pblue,
    % define the list of colors usable in the diagram
    set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 0.6,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}
