% example_cap_hyp_amoeba.m
% Nasser, June 22, 2019
clear; clc
% To compute the values of hyperbolic capacity of the 
% amoeba-shaped boundary presented in Table 18 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% A vector of values of n; n=64,128,256,512,1024,2048,4096
nv       =   2.^(6:12).';
%
for k=1:length(nv)
    n=nv(k);
    t        =  (0:2*pi/n:2*pi-2*pi/n).';
    s1    =  sin(t);
    s2    =  sin(2.*t);
    s4    =  sin(4.*t);
    c1    =  cos(t);
    c2    =  cos(2.*t);
    es    =  exp(sin(t));
    ec    =  exp(cos(t));
    %R     =  exp(cos(s)).*((cos(2.*s)).^2)+exp(sin(s)).*((sin(2.*s)).^2);
    R     =  ec.*c2.^2+es.*s2.^2;
    Rp    = -s1.*c2.^2.*ec+c1.*s2.^2.*es+2.*s4.*(es-ec);
    zet   =  0.1+0.6i+0.2.*R.*exp(-i.*t);
    zetp  =  0.2.*(Rp-i.*R).*exp(-i.*t);
    
    alpha          =  0;
    z2             =  0.25+0.5i;
    
    et(1:n,1)      =     exp(i.*t);
    etp(1:n,1)     =  i.*exp(i.*t);
    
    et(n+1:2*n,1)  =     zet;
    etp(n+1:2*n,1) =     zetp;
    
    hypcap(k,1)  =  annq (et,etp,n,alpha,z2,'b');
end
%
format long g
[nv hypcap]
%
figure
hold on
box on
crv=et(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=et(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
axis equal
axis([-1 1 -1  1])
set(gca,'LooseInset',get(gca,'TightInset'))
%