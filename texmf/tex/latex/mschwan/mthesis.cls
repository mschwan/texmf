\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mthesis}[2017/01/03 my bachelor thesis class]
\LoadClassWithOptions{book}

\let\@thesis\@empty
\let\@university\@empty
\let\@department\@empty
\let\@matrnumber\@empty
\let\@supervisor\@empty
\let\@supervisorext\@empty
\let\@organizationext\@empty
\let\@departmentext\@empty
\def\@logo{\rule{2cm}{2cm}}
\newcommand{\thesis}[1]{\gdef\@thesis{#1}}
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\matrnumber}[1]{\gdef\@matrnumber{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\supervisorext}[1]{\gdef\@supervisorext{#1}}
\newcommand{\organizationext}[1]{\gdef\@organizationext{#1}}
\newcommand{\departmentext}[1]{\gdef\@departmentext{#1}}
\newcommand{\logo}[1]{\gdef\@logo{\includegraphics{#1}}}

\providecommand*{\supervisedby}{supervised by:}
\AtBeginDocument{
    \@ifpackagewith{babel}{english}{%
        \addto\captionsenglish{\renewcommand*\supervisedby{supervised by:}}%
    }{}
    \@ifpackagewith{babel}{ngerman}{%
        \addto\captionsngerman{\renewcommand*\supervisedby{betreut durch:}}%
    }{}
}

\providecommand*{\matriculationnumber}{matriculation number: }
\AtBeginDocument{
    \@ifpackagewith{babel}{english}{
        \addto\captionsenglish{
            \renewcommand*\matriculationnumber{matriculation number: }
        }
    }{}
    \@ifpackagewith{babel}{ngerman}{
        \addto\captionsngerman{
            \renewcommand*\matriculationnumber{Matrikelnummer: }
        }
    }{}
}

\renewcommand\maketitle{
    \thispagestyle{empty}
    \vspace{5ex}
    \begin{center}
        {\@logo
         \par\vspace{5ex}}
        {\Huge\textbf
         \@title
         \par\vspace{3ex}}
        {\@thesis\\
         \@university\\
         \@department
         \par\vspace{3ex}}
        {\@author\\
         \matriculationnumber\@matrnumber
         \par\vspace{5ex}}
        {\@date\par}
    \end{center}
    \vfill
    {\textbf\supervisedby\par}
    {\@supervisor\\\@university\par}
    {\@supervisorext\\\@departmentext\\\@organizationext\par}
}
