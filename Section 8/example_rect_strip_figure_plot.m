% example_rect_strip_figure_plot.m
% Nasser, June 17, 2019
clc;clear; 
% To plot Figure 34 in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
d        =   0.1
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the boundary
rec_ver    =  [1+d*i ; 1-d*i ; -d*i ; d*i ]; % Vertices of the outer polygon
[zet(1:n,1),zetp(1:n,1)] = polygonp(rec_ver,n/length(rec_ver));
Phi        =   @(z)(1-2./(exp(z)+1));  %(exp(z)-1)./(exp(z)+1)
Phip       =   @(z)(2.*exp(z)./((exp(z)+1).^2));  
%
et(1:n,1)      =  exp(i.*t);
etp(1:n,1)     =  i.*exp(i.*t);
et(n+1:2*n,1)  =  Phi(zet);
etp(n+1:2*n,1) =  Phip(zet).*zetp;
%
figure
hold on
plot(real(zet(1:n,1)),imag(zet(1:n,1)),'b','LineWidth',1.2)
plot([-2 2],[-pi/2 -pi/2],'k','LineWidth',1.2)
plot([-2 2],[ pi/2  pi/2],'k','LineWidth',1.2)

axis equal
axis([-2 2 -2 2])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_rec_strip
% print -depsc fig_rec_strip
%
%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)

axis equal
axis([-1.05 1.05 -1.05 1.05])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_rec_stripc
% print -depsc fig_rec_stripc
%