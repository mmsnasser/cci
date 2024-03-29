function Readme()
%README
%
% Mohamed Nasser, 2019
% Please cite these collections of MATLAB files as:

% M. Nasser and M. Vuorinen, Computation of conformal invariants, ***. 
% https://github.com/mmsnasser/cci.
%
% 
% The main file in these collections of MATLAB files is the file
% annq.m
% 
% This function computes the inner radius q for the conformal mapping
% w=Phi(z) from doubly connected domain G onto the annulus q<|w|<1 and
% the capacity of G, cap(G)=2pi/log(1/q),  where:
% et, etp:  the parametrization of the boundary of G and its derivative 
% n: the number of discretization points
% zz: zz=alpha is a given point in $G$ for bounded G; 
%     and zz=z1 is a given point in the interior of the curve that will be
%     maped onto the unit circle for unbounded G
% z2: a given point interior to the curve that will be maped onto the 
% circle |w|=q for both cases of bounded and unbounded G.
% type='b' for bounded G; and type='u' for unbounded G
% 
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% This collection of MATLAB files contains the files used for the
% computations presented in the paper:
% 
% M.M.S. Nasser and M. Vuorinen, Computation of conformal invariants,.
% 
% The files are organized according to the sections in the paper.
% To use these files, you need to copy the mail files to sech section.
% 
% 
% In the function annq.m, we use the MATLAB function 
% fbie.m
% which is available in:
% 
% M.M.S. Nasser, FBIEGNK:  A MATLAB toolbox for fast solution of 
% boundary integral equations with the generalized Neumann kernel, 
% Version 1.1, 2016. https://github.com/mmsnasser/FBIEGNK.
% 
% and in:
% M.M.S. Nasser, Fast solution of boundary integral equations with the 
% generalized Neumann kernel, Electronic Transactions on Numerical 
% Analysis,  44 (2015) 189--229.
% 
%
% The MATLAB function fbie depends on the following files:
% 
% zfmm2dpart.m
% fmm2d_r2012a.mexw32
% fmm2d_r2012a.mexw64
% pthreadGC2-w32.dll
% pthreadGC2-w64.dll
% 
% from the MATLAB Toolbox:
% L. GREENGARD AND Z. GIMBUTAS , FMMLIB2D: A MATLAB toolbox for
% fast multipole method in two dimensions, Version 1.2, 2012.
%
% You can download the whole toolbox from:
% http://www.cims.nyu.edu/cmcl/fmm2dlib/fmm2dlib.html
% or from
% https://github.com/zgimbutas/fmmlib2d
%
% Please see: 
% https://github.com/zgimbutas/fmmlib2d/blob/master/COPYING
% for more details.
% 
% PLEASE cite the FMMLIB2D toolbox whenever you use the function annq.m.
%
% Acknowledgments:
% I would like to thank Prof. Leslie Greengard and Prof. Zydrunas Gimbutas 
% for making the MATLAB toolbox FMMLIB2D publicly available.
%
%
%
% This program is free software; you can redistribute it and/or modify 
% it under the terms of the GNU General Public License as published by 
% the Free Software Foundation; either version 2 of the License, or 
% (at your option) any later version.  This program is distributed in 
% the hope that it will be useful, but WITHOUT ANY WARRANTY; without 
% even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
% PARTICULAR PURPOSE.  See the GNU General Public License for more 
% details. You should have received a copy of the GNU General Public 
% License along with this program; 
% if not, see <http://www.gnu.org/licenses/>.
%
end