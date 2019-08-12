% example_rect_half_h_table.m
% Nasser, June 17, 2019
clc;clear; 
% To compute the values capacity in Table 15
% in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% ----------------part 1---------------------
% to compute the capacity for a rectangle in the upper half-plane
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
    rec_ver  =  [1+( 0.5+d)*i ; 1+( 0.5-d)*i ; 0+( 0.5-d)*i ; 0+( 0.5+d)*i ]; % Vertices of the polygon
    [zet(1:n,1),zetp(1:n,1)] = polygonp(rec_ver,n/length(rec_ver));
    %
    Psi      =  @(z)(i+2./(i+z));
    Psip     =  @(z)(-2./((i+z).^2));
    %
    et(1:n,1)      =  exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);
    et(n+1:2*n,1)  =  Psi(zet);
    etp(n+1:2*n,1) =  Psip(zet).*zetp;
    alpha          =  Psi(1.5i);
    z2             =  Psi(0.5+0.5i);
    [~,app_cap(k,1)] =  annq (et,etp,n,alpha,z2,'b');
    time_num(k,1) = toc;
end
%
% 
% 
% ----------------part 2---------------------
% to compute the capacity for the a slit in the upper half-plane
%
a  =  0+0.5i; b  =  1+0.5i; 
tic
dv(L+1,1) = 0;
app_cap(L+1,1)    = cap_of_half_slit(a,b,n,0.1,1e-14);
time_num(L+1,1)   = toc;
% 
% 
% 
format long g
[dv  app_cap  app_cap./2  time_num]
%