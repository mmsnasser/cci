% example_cap_hyp_square.m
% Nasser, June 22, 2019
clear; clc
% To compute the values of hyperbolic capacity of the 
% square domain [-r,r]*[-r,r]. The cap will be used in the file
% example_cap_square_error_plot.m
% to plot Figure 48 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% A vector of values of r; for the square domain [-r,r]*[-r,r]
rv       =   [linspace(0.01,0.69,30)].';
%
n        =   2^13
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%
for k=1:length(rv)
    r           =  rv(k);    
    et(1:n,1)      =     exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);
    % The vertices of the inner boundary must clockwise. So, we choose the
    % vertices of the square to be clockwise oriented
    ver         = [r+r*i ;  r-r*i ; -r-r*i ; -r+r*i];  % Vertices of the square
    [et(n+1:2*n,1),etp(n+1:2*n,1)]    =  polygonp(ver,n/length(ver));
    %
    alpha          =  0.5*(1+r);
    z2             =  0;
    hypcap(k,1)    =  annq (et,etp,n,alpha,z2,'b');
end
%
format long g
[rv  hypcap]
%