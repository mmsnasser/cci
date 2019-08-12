% example_cap_ell_square.m
% Nasser, June 22, 2019
clear; clc
% To compute the values of elliptic capacity of the 
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
    r              =  rv(k);    
    % The vertices of the inner boundary must clockwise. So, we choose the
    % vertices of the square to be clockwise oriented
    ver            = [r+r*i ;  r-r*i ; -r-r*i ; -r+r*i];  % Vertices of the square
    [et(n+1:2*n,1),etp(n+1:2*n,1)]     =  polygonp(ver,n/length(ver));    
    % The external boundary must be counterclockwise oriented. So, we chage
    % the orrientation of the inner square to be counterclockwise, call it
    %  zet, zetp (we multiply by -1 beacuse we change the orintation. 
    % Hence, the parametrization of the external boundary will be 
    % -1/conj(zet) and the orientation will be counterclockwise.
    zet            =  et(2*n:-1:n+1,1);
    zetp           = -etp(2*n:-1:n+1,1);
    et(1:n,1)      = -conj(1./zet);
    etp(1:n,1)     =  conj(zetp./(zet.^2));
    %
    alpha          =  0.5*(r+1/r);
    z2             =  0;
    ellcap(k,1)    =  sqrt(annq (et,etp,n,alpha,z2,'b'));
end
%
format long g
[rv  ellcap]
%