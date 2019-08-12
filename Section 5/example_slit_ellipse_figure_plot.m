% example_slit_ellipse_figure_plot.m
% Nasser, June 22, 2019
clc;clear; 
% To plot Figure 51 in Section 15 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% the values of your chosen constants a, b, c, and d
c         =  1.5;
d         =  3.5;
a         = (d+c)/2;
b         = (d-c)/2;
% Choose the value of n
n         =  2^12
t         =  (0:2*pi/n:2*pi-2*pi/n).';
%
r         =   0.1;
ete       =   a+b.*cos(t)-i*r.*sin(t);
%
r         =   1;
etc       =   a+b.*cos(t)-i*r.*sin(t);
%
%
figure;
hold on
box on
plot([0 1],[0 0],'k','LineWidth',1)
plot([real(c) real(d)],[imag(c) imag(d)],'b','LineWidth',1)
axis equal
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_slit_ellipse1
%
% 
figure;
hold on
box on
plot([0 1],[0 0],'k','LineWidth',1)
plot(real(ete),imag(ete),'b','LineWidth',1)
axis equal
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_slit_ellipse2
%
% 
figure;
hold on
box on
plot([0 1],[0 0],'k','LineWidth',1)
plot(real(etc),imag(etc),'b','LineWidth',1)
axis equal
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_slit_ellipse3
%