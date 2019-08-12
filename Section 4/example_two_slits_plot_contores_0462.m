% example_two_slits_plot_contores_0462.m
% Nasser, June 11, 2019
clc;clear; 
% To plot Figure 16 in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% The data files 
% x04_pt.mat, y04_pt.mat, u0462_pt.mat
% were generated by the file
% example_two_slits_save_contores_0462.m
%
%
%
z1=6+2i;
x=load('x04_pt.mat','-ascii');
y=load('y04_pt.mat','-ascii');
u=load('u0462_pt.mat','-ascii');
%
figure
cntv  =  1.3:0.3:3.5;
contour(x,y,u,cntv,'ShowText','on','Color','k')
hold on
plot(real(z1),imag(z1),'or','MarkerFaceColor','r')
plot([0 4],[0 0],'k','LineWidth',2)
axis([-0.0 12 -0.0 10])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_seg_m6_n2
% print -depsc fig_two_seg_m6_n2
%