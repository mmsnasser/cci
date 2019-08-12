% example_cap_amoeba_domain_plot.m
% Nasser, June 22, 2019
clear; clc
% To plot the domain G in Figure 49 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
n        =   2^12
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%
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
zetp  =  0.2.*(Rp+i.*R).*exp(-i.*t);
alpha =  0.25+0.5i;
% 
% 
figure
plot(real(zet),imag(zet),'k','LineWidth',1.5)
hold on
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
text(0.3,0.55,'{$\alpha$}','FontSize',18,'Interpreter','latex')
set(gca,'XTick',[-1:1:1],'FontSize',15);
set(gca,'YTick',[-1:1:1]);
text(0,-0.25,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.00 1.00 -1.00 1.00])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_am_clog
%
%    
et(1:n,1)      =  exp(i.*t);
et(n+1:2*n,1)  =  zet;
alpha          =  0;
z2             =  0.25+0.5i;
figure
crv=et(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=et(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
text(0.05,0.05,'{$\alpha$}','FontSize',18,'Interpreter','latex')
text(0.3,0.55,'{$z_2$}','FontSize',18,'Interpreter','latex')
set(gca,'XTick',[-1:1:1],'FontSize',15);
set(gca,'YTick',[-1:1:1]);
text(0,-0.25,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.05 1.05 -1.05 1.05])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_am_chyp
%
%
et(1:n,1)      =  zet;
xet            =  zet(n:-1:1,1);
et(n+1:2*n,1)  = -conj(1./xet);
z1             =  0.25+0.5i;
z2             = -conj(1./z1);
figure
crv=et(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=et(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(z1),imag(z1),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
text(0.3,0.62,'{$z_1$}','FontSize',18,'Interpreter','latex')
text(-0.75,-1.45,'{$z_2$}','FontSize',18,'Interpreter','latex')
set(gca,'XTick',[-2:1:2],'FontSize',15);
set(gca,'YTick',[-3:1:1]);
text(0.5,-0.5,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-2.5 2 -3.5 1])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_am_cell
%%   