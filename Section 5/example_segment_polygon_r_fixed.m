% example_segment_polygon_r_fixed.m 
% Nasser, June 10, 2019
clear;clc
% This code plot Figure 10 (left) of the segment and plogon 
% domain in Section 5 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_segment_polygon.m)
%
% Choose a value for r
r         =   1;
% choose a vector of values for a such that a>1+r>1
av        =  [2.05,2.07,2.1,2.14,2.2,2.3,2.4,2.6,2.9,3.2,3.5:0.5:6.5];
% choose a value for m (number of vertices)
m         =   16    % choose the number of vertices of the polygon
% choose the value of n; n must be a multiple of m
n         =  3*5*2^9;
%
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Psi     =  @(z)(0.25.*(z+1./z)+0.5);
Psiv    =  @(z)(1./((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2))));
Psivp   =  @(z)(4./(1-1./(Psiv(z).^2)));
for itr=1:length(av)
    a    =  av(itr);    
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
%
format short g
[av.'  app_cap.']
%
figure
hold on
box on
for j=1:2
    crv   = Psi(et((j-1)*n+1:j*n));crv(n+1) = crv(1);
    plot(crv,'k')
end
plot(vert,'ok')
axis equal
set(gca,'LooseInset',get(gca,'TightInset'))
%
figure;
hold on
box on
for k=1:2
    crv   =  et((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
    plot(real(crv),imag(crv),'k')
end
plot(real(alpha),imag(alpha),'+b')
plot(real(z2),imag(z2),'+r')
axis equal
%