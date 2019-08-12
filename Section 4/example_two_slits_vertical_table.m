% example_two_slits_vertical_table.m
% Nasser, June 11, 2019
clc;clear; 
% To compute the values cap([a,a'],[c,c']) in Table 8
% in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% Here, we re-compute the capacity computed in Table 3 (right) in
% the paper: S. Bezrodnykh, A. Bogatyrev, S. Goreinov, O. Grigoriev, H.
% Hakula, and M. Vuorinen: On capacity computation for symmetric  
% polygonal condensers. J. Comput. Appl. Math. (to appear).
%
%
av = [i    ; 2i   ; 3i   ; 4i   ; 5i   ; 3i   ];
cv = [5+2i ; 5+2i ; 5+2i ; 5+2i ; 5+2i ; 5+3i ];
%
n         =  2^11;
t         =   (0:2*pi/n:2*pi-2*pi/n).';
%
for kk=1:length(av)
    tic
    a  =  av(kk);
    c  =  cv(kk);
    app_cap(kk,1) = cap_of_two_slits(a,conj(a),c,conj(c),n,0.5,1e-14);
    time_num(kk,1)= toc;
end
%
format long 
[app_cap time_num]
%