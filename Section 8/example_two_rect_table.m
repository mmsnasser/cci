% example_two_rect_table.m
% Nasser, June 17, 2019
clc;clear; 
% To compute the values capacity in Table 13
% in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% ----------------part 1---------------------
% to compute the capacity for the two rectangle
% 
% The vector d of the width of the rectangles 
dv       =   [0.4 0.3 0.2 0.1 0.05 0.02 0.01 0.005].';
% 
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
L        =   length(dv);
for k=1:L
    d = dv(k);
    tic
    % The parametization of the boundary
    out_ver    =  [1+( 0.5+d)*i ; 1+( 0.5-d)*i ; 0+( 0.5-d)*i ; 0+( 0.5+d)*i ]; % Vertices of the outer polygon
    in_ver     =  [1+(-0.5+d)*i ; 1+(-0.5-d)*i ; 0+(-0.5-d)*i ; 0+(-0.5+d)*i ]; % Vertices of the inner polygon
    [et(1:n,1)    ,etp(1:n,1)    ] = polygonp(out_ver,n/length(out_ver));
    [et(n+1:2*n,1),etp(n+1:2*n,1)] = polygonp(in_ver,n/length(in_ver));
    %
    z1        =  0.5+0.5i;
    z2        =  0.5-0.5i;
    [~,app_cap(k,1)]  =  annq (et,etp,n,z1,z2,'u')
    time_num(k,1) = toc;
end
%
% 
% 
% ----------------part 2---------------------
% to compute the capacity for the two slits
% 
a         =  0.5i;  b         =  1+0.5i;
c         = -0.5i;  d         =  1-0.5i;
tic
dv(L+1,1) = 0;
app_cap(L+1,1)    = cap_of_two_slits(a,b,c,d,n,0.5,1e-14);
time_num(L+1,1)   = toc;
% 
% 
% 
format long g
[dv  app_cap  time_num]
%