% example_segment_polygon_a_fixed.m 
% Nasser, June 10, 2019
clear;clc
% This code plot Figure 10 (right) of the segment and plogon 
% domain in Section 5 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_segment_polygon.m)
%
% Choose a value for a
a         =   4;
% choose a vector of values for r such that a>1+r>1
rv        =  [0.05,0.1,0.175,0.25,0.35,0.45,0.6:0.2:2.4,2.5,2.6,2.7,2.75,2.8,2.85,2.90,2.925,2.95];
% choose a value for m (number of vertices)
m         =   16    % choose the number of vertices of the polygon
% choose the value of n; n must be a multiple of m
n         =  3*5*2^9;
%
t         = (0:2*pi/n:2*pi-2*pi/n).';
Psi      =  @(z)(0.25.*(z+1./z)+0.5);
Psiv     =  @(z)(1./((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2))));
Psivp    =  @(z)(4./(1-1./(Psiv(z).^2)));
for itr=1:length(rv)
    r = rv(itr);
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
[rv.'  app_cap.']
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