%%
%% This is file `utthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% utthesis.dtx  (with options: `class')
%% ----------------------------------------------------------------
%% utthesis --- A class for the UT thesis
%% E-mail: henryiii@physics.utexas.edu
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% ----------------------------------------------------------------
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\jobname}[2014/12/12 v0.2  A class for the UT thesis]
\LoadClass[12pt,oneside]{memoir}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{etoolbox}
\RequirePackage{setspace}

\setlrmarginsandblock{1.25in}{1.25in}{*} % spine, edge
\setulmarginsandblock{1.25in}{1.5in}{*} % {hupperi}{hloweri}{hratioi}
\setheadfoot{.5in}{.5in} % Headheight, footskip
\setheaderspaces{*}{.25in}{*} % headdrop, headsep, ratio

\checkandfixthelayout
\typeoutlayout

\pagestyle{plain}

\newcommand\UTSpacing{\OnehalfSpacing}
\DeclareOption{double}{\renewcommand\UTSpacing{\DoubleSpacing}}
\DeclareOption{single}{\renewcommand\UTSpacing{\SingleSpacing}}
\ProcessOptions\relax
\UTSpacing

\setsecnumdepth{subsubsection}

\def\UTNumToName#1{%
\if!\ifnum9<1#1!\fi
\NumToName{#1}\else#1\fi}

\renewcommand\chapternumberline[1]{%
   \@chapapp@head\@cftbsnum \UTNumToName{#1}\@cftasnum\afterchapternum}
\renewcommand\cftchaptername{\chaptername~}
\renewcommand{\cftappendixname}{\appendixname~}

\renewcommand{\cftchapterfont}{}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\renewcommand{\cftchapterleader}{\normalfont\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterpagefont}{}

\setlength\cftparskip{2ex}
\setlength\cftbeforechapterskip{0em}
\setlength\cftbeforesectionskip{0em}
\renewcommand\insertchapterspace{}

\cftsetindents{section}{2em}{0em}

\let\thesisnumberline\numberline
\renewcommand{\numberline}[1]{}

\let\oldlistoffigures\listoffigures
\def\thesislistoffigures{%
\clearpage
\SingleSpacing
    \let\numberline\thesisnumberline
    \oldlistoffigures
    \renewcommand{\numberline}[1]{}
    \UTSpacing
    }
\let\listoffigures\thesislistoffigures

\let\oldlistoftables\listoftables
\def\thesislistoftables{%
\clearpage
\SingleSpacing
\let\numberline\thesisnumberline
\oldlistoftables
\renewcommand{\numberline}[1]{}
\UTSpacing
}
\let\listoftables\thesislistoftables

\renewcommand{\afterchapternum}{:~}
\renewcommand{\chapnamefont}{\bfseries\Large\centering}
\renewcommand{\chaptitlefont}{\chapnamefont}
\setlength\beforechapskip{-\baselineskip}
\renewcommand{\printchapternum}{\UTNumToName{\thechapter}}

\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

\let\oldtableofcontents\tableofcontents
\RenewDocumentCommand \tableofcontents { s t. } {%
\clearpage
\SingleSpacing
\IfBooleanTF #2 {%
\let\numberline\thesisnumberline
\cftsetindents{section}{1em}{2em}
\oldtableofcontents*
\cftsetindents{section}{1em}{0em}
\renewcommand\numberline[1]{}
}{%
    \renewcommand\numberline[1]{}
    \oldtableofcontents*
    }
    \UTSpacing
}
\newcommand{\UTdegree}{Ph.D.}
\newcommand{\UTlongdegree}{Doctor of Philosophy}
\newcount\UTyear
\UTyear=\year
\DeclareDocumentCommand{\UTcopyrightlegend}{  }{%
\begin{titlingpage}
\begin{vplace}
\centering\Large\bfseries
Copyright\\
by\\
\theauthor\\
\the\UTyear
\end{vplace}
\end{titlingpage}}
\DeclareDocumentCommand{\UTaddcommittee}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1

}
\DeclareDocumentCommand{\UTaddsupervisor}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1, Supervisor
}
\DeclareDocumentCommand{\UTaddcosupervisor}{ m }{
\vskip 3em
\hrule
\vskip .4em
#1, Co-Supervisor
}
\DeclareDocumentCommand{\UTtitlepage}{m m}{
\begin{titlingpage}
\begin{vplace}
\centering
{
\bfseries
\thetitle
}

\vskip 1em

by

\vskip 1em

{
\bfseries
\theauthor, #1

\vskip 3em
Dissertation
}

Presented to the Faculty of the Graduate School of\\
The University of Texas at Austin\\
in Partial Fulfillment\\
of the Requirements\\
for the degree of\\
{\bfseries \UTlongdegree}

\vskip 3em

The University of Texas at Austin\\
#2, \the\UTyear
\end{vplace}
\end{titlingpage}}
\DeclareDocumentEnvironment{UTabstract}{ O{} m  }{ %
\begin{center}
{\bfseries\thetitle}

\vskip 2em

\theauthor, \UTdegree

The University of Texas at Austin, \the\UTyear

\vskip 2em

Supervisor#1: #2

\vskip 2em

\end{center}
\indent
}{}
\DeclareDocumentEnvironment{UTcommittee}{o}{ %
\begin{titlingpage}
\bfseries
\begin{center}
\begin{SingleSpace}
The Dissertation Committee for \theauthor\ certifies that this is the approved version of the following dissertation:
\end{SingleSpace}
\vskip 2.5em
\large
\thetitle
\end{center}
\vskip 5em
\begin{flushright}
\begin{minipage}[b]{3in}
\begin{flushleft}
Committee:
}{ %
\end{flushleft}
\end{minipage}
\end{flushright}
\end{titlingpage}}

\let\jnl@style=\rmfamily
\def\ref@jnl#1{{\jnl@style#1}}%
\newcommand\aj{\ref@jnl{AJ}}%        % Astronomical Journal
\newcommand\araa{\ref@jnl{ARA\&A}}%  % Annual Review of Astron and Astrophys
\newcommand\apj{\ref@jnl{ApJ}}%    % Astrophysical Journal
\newcommand\apjl{\ref@jnl{ApJ}}%     % Astrophysical Journal, Letters
\newcommand\apjs{\ref@jnl{ApJS}}%    % Astrophysical Journal, Supplement
\newcommand\ao{\ref@jnl{Appl.~Opt.}}%   % Applied Optics
\newcommand\apss{\ref@jnl{Ap\&SS}}%  % Astrophysics and Space Science
\newcommand\aap{\ref@jnl{A\&A}}%     % Astronomy and Astrophysics
\newcommand\aapr{\ref@jnl{A\&A~Rev.}}%  % Astronomy and Astrophysics Reviews
\newcommand\aaps{\ref@jnl{A\&AS}}%    % Astronomy and Astrophysics, Supplement
\newcommand\azh{\ref@jnl{AZh}}%       % Astronomicheskii Zhurnal
\newcommand\baas{\ref@jnl{BAAS}}%     % Bulletin of the AAS
\newcommand\icarus{\ref@jnl{Icarus}}% % Icarus
\newcommand\jrasc{\ref@jnl{JRASC}}%   % Journal of the RAS of Canada
\newcommand\memras{\ref@jnl{MmRAS}}%  % Memoirs of the RAS
\newcommand\mnras{\ref@jnl{MNRAS}}%   % Monthly Notices of the RAS
\newcommand\pra{\ref@jnl{Phys.~Rev.~A}}% % Physical Review A: General Physics
\newcommand\prb{\ref@jnl{Phys.~Rev.~B}}% % Physical Review B: Solid State
\newcommand\prc{\ref@jnl{Phys.~Rev.~C}}% % Physical Review C
\newcommand\prd{\ref@jnl{Phys.~Rev.~D}}% % Physical Review D
\newcommand\pre{\ref@jnl{Phys.~Rev.~E}}% % Physical Review E
\newcommand\prl{\ref@jnl{Phys.~Rev.~Lett.}}% % Physical Review Letters
\newcommand\pasp{\ref@jnl{PASP}}%     % Publications of the ASP
\newcommand\pasj{\ref@jnl{PASJ}}%     % Publications of the ASJ
\newcommand\qjras{\ref@jnl{QJRAS}}%   % Quarterly Journal of the RAS
\newcommand\skytel{\ref@jnl{S\&T}}%   % Sky and Telescope
\newcommand\solphys{\ref@jnl{Sol.~Phys.}}% % Solar Physics
\newcommand\sovast{\ref@jnl{Soviet~Ast.}}% % Soviet Astronomy
\newcommand\ssr{\ref@jnl{Space~Sci.~Rev.}}% % Space Science Reviews
\newcommand\zap{\ref@jnl{ZAp}}%       % Zeitschrift fuer Astrophysik
\newcommand\nat{\ref@jnl{Nature}}%  % Nature
\newcommand\iaucirc{\ref@jnl{IAU~Circ.}}% % IAU Cirulars
\newcommand\aplett{\ref@jnl{Astrophys.~Lett.}}%  % Astrophysics Letters
\newcommand\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res.}}% % Astrophysics Space Physics Research
\newcommand\bain{\ref@jnl{Bull.~Astron.~Inst.~Netherlands}}% % Bulletin Astronomical Institute of the Netherlands
\newcommand\fcp{\ref@jnl{Fund.~Cosmic~Phys.}}%   % Fundamental Cosmic Physics
\newcommand\gca{\ref@jnl{Geochim.~Cosmochim.~Acta}}% % Geochimica Cosmochimica Acta
\newcommand\grl{\ref@jnl{Geophys.~Res.~Lett.}}%  % Geophysics Research Letters
\newcommand\jcp{\ref@jnl{J.~Chem.~Phys.}}%     % Journal of Chemical Physics
\newcommand\jgr{\ref@jnl{J.~Geophys.~Res.}}%     % Journal of Geophysics Research
\newcommand\jqsrt{\ref@jnl{J.~Quant.~Spec.~Radiat.~Transf.}}%   % Journal of Quantitiative Spectroscopy and Radiative Trasfer
\newcommand\memsai{\ref@jnl{Mem.~Soc.~Astron.~Italiana}}% % Mem. Societa Astronomica Italiana
\newcommand\nphysa{\ref@jnl{Nucl.~Phys.~A}}%     % Nuclear Physics A
\newcommand\physrep{\ref@jnl{Phys.~Rep.}}%       % Physics Reports
\newcommand\physscr{\ref@jnl{Phys.~Scr}}%        % Physica Scripta
\newcommand\planss{\ref@jnl{Planet.~Space~Sci.}}%  % Planetary Space Science
\newcommand\procspie{\ref@jnl{Proc.~SPIE}}%      % Proceedings of the SPIE

\newcommand\actaa{\ref@jnl{Acta Astron.}}%  % Acta Astronomica
\newcommand\caa{\ref@jnl{Chinese Astron. Astrophys.}}%  % Chinese Astronomy and Astrophysics
\newcommand\cjaa{\ref@jnl{Chinese J. Astron. Astrophys.}}%  % Chinese Journal of Astronomy and Astrophysics
\newcommand\jcap{\ref@jnl{J. Cosmology Astropart. Phys.}}%  % Journal of Cosmology and Astroparticle Physics
\newcommand\na{\ref@jnl{New A}}%  % New Astronomy
\newcommand\nar{\ref@jnl{New A Rev.}}%  % New Astronomy Review
\newcommand\pasa{\ref@jnl{PASA}}%  % Publications of the Astron. Soc. of Australia
\newcommand\rmxaa{\ref@jnl{Rev. Mexicana Astron. Astrofis.}}%  % Revista Mexicana de Astronomia y Astrofisica

%% 
%% Copyright (C) 2014 by Henry Schreiner <henryiii@physics.utexas.edu>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Henry Schreiner.
%% 
%% This work consists of the file  utthesis.dtx
%% and the derived files           utthesis.ins,
%%                                 utthesis.pdf,
%%                                 utthesis.cwl, and
%%                                 utthesis.cls.
%% 
%%
%% End of file `utthesis.cls'.
