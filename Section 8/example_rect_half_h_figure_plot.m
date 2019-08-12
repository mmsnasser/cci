% example_rect_half_h_figure_plot.m
% Nasser, June 17, 2019
clc;clear; 
% To plot Figure 33 in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% 
d        =   0.1
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the boundary
rec_ver  =  [1+( 0.5+d)*i ; 1+( 0.5-d)*i ; 0+( 0.5-d)*i ; 0+( 0.5+d)*i ]; % Vertices of the polygon
[zet(1:n,1),zetp(1:n,1)] = polygonp(rec_ver,n/length(rec_ver));
Psi      =  @(z)(i+2./(i+z));
Psip     =  @(z)(-2./((i+z).^2));
%
et(1:n,1)      =  exp(i.*t);
etp(1:n,1)     =  i.*exp(i.*t);
et(n+1:2*n,1)  =  Psi(zet);
etp(n+1:2*n,1) =  Psip(zet).*zetp;
%
figure
hold on
plot(real(zet(1:n,1)),imag(zet(1:n,1)),'b','LineWidth',1.2)
plot([-3 3],[0 0],'k','LineWidth',1.2)
axis equal
axis([-1.0 2.0 -1.0 2.0])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_rec_half_h
% print -depsc fig_rec_half_h
% 
% 
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)
% plot(real(alpha),imag(alpha),'or')
% plot(real(z2),imag(z2),'ok')
axis equal
axis([-1.05 1.05 -1.05 1.05])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_rec_halfc_h
% print -depsc fig_rec_halfc_h
%