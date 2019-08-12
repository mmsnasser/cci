% example_segment_polygon_table.m 
% Nasser, June 10, 2019
clear;clc
% This code compute the values in the Table of the segment and plogon 
% domain in Section 5 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_segment_polygon.m)
%
%  Choose a value for r; Radius of the vertices
r    =   1;    
% Choose a value for a; Center of the ploygon
a    =   2.1;  
% choose a vector of values for m (number of vertices)
mvc= [3,8,16,128];
% choose the value of n; n must be a multiple of the values of mvc
n       =  3*5*2^9;
%
t       = (0:2*pi/n:2*pi-2*pi/n).';
Psi     =  @(z)(0.25.*(z+1./z)+0.5);
Psiv    =  @(z)(1./((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2))));
Psivp   =  @(z)(4./(1-1./(Psiv(z).^2)));
for itr =  1:length(mvc)
    m       =  mvc(itr);
    vert    =  a-r.*exp(-i.*[0:2*pi/m:2*pi-2*pi/m]); 
    [eto , etop ] = polygonp(vert,n/length(vert));
    
    et(1:n,1)        =  exp(i.*t);
    etp(1:n,1)       =  i.*exp(i.*t);
    et(n+1:2*n,1)    =  Psiv(eto);
    etp(n+1:2*n,1)   =  Psivp(eto).*etop;
    
    alpha1  = 0.5*(max(real(et(n+1:2*n,1)))+1);
    alpha2  = 0.5*(min(real(et(n+1:2*n,1)))-1);
    if abs(alpha1)>abs(alpha2)
        alpha=alpha2;
    else
        alpha=alpha1;
    end
    z2  = 0.5*(max(real(et(n+1:2*n,1)))+min(real(et(n+1:2*n,1))))+...
         0.5i*(max(imag(et(n+1:2*n,1)))+min(imag(et(n+1:2*n,1))));
     
    [~,app_cap(itr)] =  annq (et,etp,n,alpha,z2,'b');    
end
format long
app_cap.'
%%