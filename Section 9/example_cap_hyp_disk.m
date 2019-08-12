% example_cap_hyp_disk.m
% Nasser, June 22, 2019
clear; clc
% To compute the error in the values of hyperbolic capacity of the disk 
% |z|<r. The error will be used in the file
% example_cap_disk_plot.m
% to plot Figure 46 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% A vector of the radius of the disk
rv       =   [linspace(0.02,0.98,30)].';
%
n        =   2^12
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%
for k=1:length(rv)
    r              =  rv(k);
    et(1:n,1)      =     exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);
    et(n+1:2*n,1)  =    r.*exp(-i.*t);
    etp(n+1:2*n,1) = -i*r.*exp(-i.*t);
    alpha          =  0.5*(1+r);
    z2             =  0;
    hypcap(k,1)    =  annq (et,etp,n,alpha,z2,'b');
end
%
rerror = abs(hypcap-rv)./rv;
format short g
[rv  rerror]
%