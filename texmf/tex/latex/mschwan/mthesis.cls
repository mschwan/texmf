% This is free and unencumbered software released into the public domain.
%
% Anyone is free to copy, modify, publish, use, compile, sell, or
% distribute this software, either in source code form or as a compiled
% binary, for any purpose, commercial or non-commercial, and by any
% means.
%
% In jurisdictions that recognize copyright laws, the author or authors
% of this software dedicate any and all copyright interest in the
% software to the public domain. We make this dedication for the benefit
% of the public at large and to the detriment of our heirs and
% successors. We intend this dedication to be an overt act of
% relinquishment in perpetuity of all present and future rights to this
% software under copyright law.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
% OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
% ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
% OTHER DEALINGS IN THE SOFTWARE.
%
% For more information, please refer to <http://unlicense.org>

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mthesis}[2018/03/22 my bachelor thesis class]
\LoadClassWithOptions{book}

\let\@thesis\@empty
\let\@university\@empty
\let\@department\@empty
\let\@course\@empty
\let\@email\@empty
\let\@matrnumber\@empty
\let\@supervisor\@empty
\let\@supervisorext\@empty
\let\@organizationext\@empty
\let\@departmentext\@empty
\def\@logo{\rule{2cm}{2cm}}
\newcommand{\thesis}[1]{\gdef\@thesis{#1}}
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\email}[1]{\gdef\@email{#1}}
\newcommand{\matrnumber}[1]{\gdef\@matrnumber{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\supervisorext}[1]{\gdef\@supervisorext{#1}}
\newcommand{\organizationext}[1]{\gdef\@organizationext{#1}}
\newcommand{\departmentext}[1]{\gdef\@departmentext{#1}}
\newcommand{\logo}[1]{\gdef\@logo{\includegraphics{#1}}}

\providecommand*{\supervisedby}{Supervised by:}
\AtBeginDocument{
    \@ifpackagewith{babel}{english}{%
        \addto\captionsenglish{\renewcommand*\supervisedby{Supervised by:}}%
    }{}
    \@ifpackagewith{babel}{ngerman}{%
        \addto\captionsngerman{\renewcommand*\supervisedby{Betreut durch:}}%
        \addto\captionsngerman{\renewcommand*\supervisedby{Betreuer:}}%
    }{}
}

\providecommand*{\matriculationnumber}{Matriculation Number: }
\AtBeginDocument{
    \@ifpackagewith{babel}{english}{
        \addto\captionsenglish{
            \renewcommand*\matriculationnumber{Matriculation Number: }
        }
    }{}
    \@ifpackagewith{babel}{ngerman}{
        \addto\captionsngerman{
            \renewcommand*\matriculationnumber{Matrikelnummer: }
        }
    }{}
}

\providecommand*{\thecourse}{Course of Studies: }
\AtBeginDocument{
    \@ifpackagewith{babel}{english}{
        \addto\captionsenglish{
            \renewcommand*\thecourse{Course of Studies: }
        }
    }{}
    \@ifpackagewith{babel}{ngerman}{
        \addto\captionsngerman{
            \renewcommand*\thecourse{Studiengang: }
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
        {{\textbf\@thesis}\\
         \@university\\
         \@department
         \par\vspace{3ex}}
        {{\textbf\@author}\\
         \@email\\
         \matriculationnumber\@matrnumber\\
         \thecourse\@course
         \par\vspace{5ex}}
        {\@date\par}
    \end{center}
    \vfill
    {\bfseries Erstpr\"ufer:\par}
    {\@supervisor\\\@university\par}
    {\textbf\supervisedby\par}
    {\@supervisorext\\\@departmentext\\\@organizationext\par}
}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
    \thispagestyle{headings}
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter}
