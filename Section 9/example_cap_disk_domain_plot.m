% example_cap_disk_domain_plot.m
% Nasser, June 22, 2019
clear; clc
% To plot the domain G in Figure 45 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
r        =   0.5;
%
n        =   2^13
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%
et          =  r.*exp(-i.*t);
alpha       =  0;
figure
plot(real(et),imag(et),'k','LineWidth',1.5)
hold on
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
text(0.05,0.05,'{$\alpha$}','FontSize',18,'Interpreter','latex')
set(gca,'XTick',[-1:1:1],'FontSize',15);
set(gca,'YTick',[-1:1:1]);
text(0,0.75,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.05 1.05 -1.05 1.05])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_cir_clog
%
%  
et(1:n,1)      =     exp(i.*t);
et(n+1:2*n,1)  =    r.*exp(-i.*t);
alpha          =  0.5*(1+r);
z2             =  0;
figure
crv=et(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=et(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
text(0.8,0.05,'{$\alpha$}','FontSize',18,'Interpreter','latex')
text(0.05,0.05,'{$z_2$}','FontSize',18,'Interpreter','latex')
% plot(cos(t),sin(t),':b')
set(gca,'XTick',[-1:1:1],'FontSize',15);
set(gca,'YTick',[-1:1:1]);
text(0,0.75,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.05 1.05 -1.05 1.05])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_cir_chyp
%
%   
et(1:n,1)      =    (-1/r).*exp(i.*t);
et(n+1:2*n,1)  =    r.*exp(-i.*t);
alpha          =  1;
z2             =  0;
figure
crv=et(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=et(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
text(1.1,0.1,'{$\alpha$}','FontSize',18,'Interpreter','latex')
text(0.1,0.1,'{$z_2$}','FontSize',18,'Interpreter','latex')
set(gca,'XTick',[-2:1:2],'FontSize',15);
set(gca,'YTick',[-2:1:2]);
text(0,1,'{$G$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-2.1 2.1 -2.1 2.1])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_cir_cell
%   