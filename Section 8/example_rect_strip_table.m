% example_rect_strip_table.m
% Nasser, June 17, 2019
clc;clear; 
% To compute the values capacity in Table 16
% in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% ----------------part 1---------------------
% to compute the capacity for a rectangle in the strip
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
    rec_ver    =  [1+d*i ; 1-d*i ; -d*i ; d*i ]; % Vertices of the outer polygon
    [zet(1:n,1),zetp(1:n,1)] = polygonp(rec_ver,n/length(rec_ver));
    Phi        =   @(z)(1-2./(exp(z)+1));  %(exp(z)-1)./(exp(z)+1)
    Phip       =   @(z)(2.*exp(z)./((exp(z)+1).^2));  
    %
    et(1:n,1)      =  exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);
    et(n+1:2*n,1)  =  Phi(zet);
    etp(n+1:2*n,1) =  Phip(zet).*zetp;
    alpha     =  Phi(-0.5);
    z2        =  Phi(0.5);
    [~,app_cap(k,1)] =  annq (et,etp,n,alpha,z2,'b');
    time_num(k,1) = toc;
end
%
% 
% 
% ----------------part 2---------------------
% to compute the capacity for the a slit in the strip
%
a  =  0; b  =  1; 
tic
dv(L+1,1) = 0;
app_cap(L+1,1)    = cap_of_strip_slit(a,b,n,0.1,1e-14);
time_num(L+1,1)   = toc;
% 
% 
% 
format long g
[dv  app_cap  time_num]
%