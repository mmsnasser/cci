% example_half_slit_plot_contores_1.m
% Nasser, June 16, 2019
clc;clear; 
% To plot Figure 24 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% The data files 
% x1_pt.mat, y1_pt.mat, u1_pt.mat
% were generated by the file
% example_half_slit_save_contores_1.m
%
%
%
z1    =  i;
x=load('x1_pt.mat','-ascii');
y=load('y1_pt.mat','-ascii');
u=load('u1_pt.mat','-ascii');
%
figure;
cntv  =  1.5:0.5:7;
contour(x,y,u,cntv,'ShowText','on','Color','k')
hold on
plot(0,1,'or','MarkerFaceColor','r')
plot([-3 3],[0 0],'k','LineWidth',2)

axis([-3.0 3.0 -0.1 3])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_half_cont
% print -dpdf  fig_half_cont
