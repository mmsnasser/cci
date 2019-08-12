% example_two_ellibses.m 
% Nasser, June 9, 2019
clear;clc
% This code plots the figure in Figure 4 (left) of the two confocal 
% ellipses domain in Section 4.2 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_two_ellibses.m)
%
% Choose a value for r2
% choose a vector of values for r1 such that r1>r2>1
r2        =   2;
r1v       =  [2.05,2.06,2.07,2.1,2.2,2.3,2.5:0.25:6];
% choose the value of n
n         =   2^12;
%
t         =  (0:2*pi/n:2*pi-2*pi/n).';
for itr=1:length(r1v)
    r1 = r1v(itr);
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
plot(r1v,log10(rerror),'-b','LineWidth',1)

xlabel('{$r_1$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[2:1:6],'FontSize',18);
set(gca,'YTick',[-15:1:-10]);
axis([2 6 -15 -10])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_ell_r2f
% print -depsc fig_two_ell_r2f
%