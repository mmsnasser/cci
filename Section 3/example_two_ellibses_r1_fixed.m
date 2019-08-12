% example_two_ellibses_r1_fixed.m 
% Nasser, June 9, 2019
clear;clc
% This code plots the figure in Figure 4 (right) of the two confocal 
% ellipses domain in Section 4.2 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_two_ellibses.m)
%
% Choose a value for r1
% choose a vector of values for r2 such that r1>r2>1
r1        =   4;
r2v       =  [1.01,1.02,1.05,1.1,1.25:0.25:3.75,3.81,3.87,3.88,3.89,3.9];
% choose the value of n
n         =   2^12;
%
t         =  (0:2*pi/n:2*pi-2*pi/n).';
for itr=1:length(r2v)
    r2 = r2v(itr);
    alpha = (0.5*(r2+1/r2)+0.5*(r1+1/r1))/2;
    z2    =  0;
    et(1:n,1)        =  0.5.*(r1*  exp(i.*t)+(1/r1).*exp(-i.*t));
    etp(1:n,1)       =  0.5.*(r1*i*exp(i.*t)-(i/r1).*exp(-i.*t));
    et(n+1:2*n,1)    =  0.5.*(   r2*exp(-i.*t)+(1/r2).*exp(i.*t));
    etp(n+1:2*n,1)   =  0.5.*(-r2*i*exp(-i.*t)+(i/r2).*exp(i.*t));
    [~,app_cap]      =  annq (et,etp,n,alpha,z2,'b');
    exact_cap   =  2*pi/log(r1/r2);
    rerror(itr) =  abs(app_cap-exact_cap)/exact_cap;  
end
% plot the figure
figure
plot(r2v,log10(rerror),'-b','LineWidth',1)

xlabel('{$r_2$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[1:1:4],'FontSize',18);
set(gca,'YTick',[-15:1:-10]);
axis([1 4 -15 -10])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_ell_r1f
% print -depsc fig_two_ell_r1f
%

