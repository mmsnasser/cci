% example_strip_slit_plot_contores_2.m
% Nasser, June 16, 2019
clc;clear; 
% To plot Figure 30 in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% The data files 
% x2_pt.mat, y2_pt.mat, u2_pt.mat
% were generated by the file
% example_strip_slit_save_contores_2.m
%
%
%
z1    =  i;
x=load('x2_pt.mat','-ascii');
y=load('y2_pt.mat','-ascii');
u=load('u2_pt.mat','-ascii');
%
figure;
cntv  =  [2:0.5:6,6.5,7.5,9];
contour(x,y,u,cntv,'ShowText','on','Color','k')
hold on
plot(0,1,'or','MarkerFaceColor','r')
plot([-3 3],[-pi/2  -pi/2],'k','LineWidth',2)
plot([-3 3],[+pi/2  +pi/2],'k','LineWidth',2)

axis equal
axis([-3.0 3.0 -1.65 1.65])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_strip_cont1
% print -dpdf  fig_strip_cont1