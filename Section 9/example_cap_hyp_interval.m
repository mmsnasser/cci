% example_cap_hyp_interval.m
% Nasser, June 22, 2019
clear; clc
% To compute the values of hyperbolic capacity for the 
% interval [0,r]. The cap will be used in the file
% example_cap_interval_plot.m
% to plot Figure 50 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% A vector of values of r; for the interval [0,r]
rv       =   [linspace(0.01,0.99,30)].';
%
n        =   2^12
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%
Phi1    = @(z,r)(z./r);
Phi1p   = @(z,r)(z-z+1./r);
Phi2    = @(z)(0.25.*(z+1./z)+0.5);
Phi2v   = @(z)((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2)));
Phi2vp  = @(z)(4./(1-1./(Phi2v(z).^2)));
%
for k=1:length(rv)
    r              =  rv(k);

    et(1:n,1)      =     exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);

    zet(1:n,1)     =  Phi2v(Phi1(et(1:n,1),r));
    zetp(1:n,1)    =  Phi2vp(Phi1(et(1:n,1),r)).*Phi1p(et(1:n,1),r).*etp(1:n,1);
    
    
    zet(n+1:2*n,1)  =    exp(-i.*t);
    zetp(n+1:2*n,1) = -i.*exp(-i.*t);
    alpha           =  Phi2v(Phi1(0.5i,r));
    z2              =  0;
    hypcap(k,1)     =  annq (zet,zetp,n,alpha,z2,'b');
    excap(k,1)      =  exp(-mu(r));
end
%
rerror = abs(hypcap-excap)./excap;
format long g
[rv  rerror hypcap]
%
figure;
hold on
box on
for k=1:2
    crv   =  zet((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
    plot(real(crv),imag(crv),'k')
end
plot(real(alpha),imag(alpha),'+b')
plot(real(z2),imag(z2),'+r')
axis equal
%