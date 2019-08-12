% example_two_recte_figure_plot.m
% Nasser, June 17, 2019
clc;clear; 
% To plot Figure 31 in Section 10 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
d        =   0.1
n        =   2^15
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the boundary
out_ver    =  [1+( 0.5+d)*i ; 1+( 0.5-d)*i ; 0+( 0.5-d)*i ; 0+( 0.5+d)*i ]; % Vertices of the outer polygon
in_ver     =  [1+(-0.5+d)*i ; 1+(-0.5-d)*i ; 0+(-0.5-d)*i ; 0+(-0.5+d)*i ]; % Vertices of the inner polygon
[et(1:n,1)    ,etp(1:n,1)    ] = polygonp(out_ver,n/length(out_ver));
[et(n+1:2*n,1),etp(n+1:2*n,1)] = polygonp(in_ver,n/length(in_ver));
%
z1        =  0.5+0.5i;
z2        =  0.5-0.5i;
%
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'k','LineWidth',1.2)

plot([1 1.25],[0.6 0.6],'--k')
plot([1 1.25],[0.4 0.4],'--k')
annotation('arrow', [.67  .67],   [.8 .7]);
annotation('arrow', [.67  .67],   [.7 .8]);
text(1.25, 0.5,'{$2d$}','FontSize',15,'Interpreter','latex');

plot([1 1.25],[-0.4 -0.4],'--k')
plot([1 1.25],[-0.6 -0.6],'--k')
annotation('arrow', [.67  .67],   [.2 .3]);
annotation('arrow', [.67  .67],   [.3 .2]);
text(1.25, -0.5,'{$2d$}','FontSize',15,'Interpreter','latex');

% text(0.7, 0.5,'{$E_1$}','FontSize',18,'Interpreter','latex');
% text(0.7,-0.5,'{$E_2$}','FontSize',18,'Interpreter','latex');
% text(0.8, 0.2,'{$G$}','FontSize',18,'Interpreter','latex');

% plot(real(z1),imag(z1),'or','markerFaceColor','r')
% plot(real(z2),imag(z2),'ob','markerFaceColor','b')

% XTick([0:0.25:1],'FontSize',15,'Interpreter','latex')

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

set(gca,'Xtick',[0:0.5:1],'FontSize',15);

axis equal
axis([-0.25 1.75 -1.0 1.0])
box off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_rect25
% print -depsc fig_rect25
%