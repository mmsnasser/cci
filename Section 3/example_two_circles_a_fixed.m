% example_two_circles_a_fixed.m 
% Nasser, June 9, 2019
clear;clc
% This code plots the figure in Figure 3 (right) of the two circle domain 
% in Section 4.1 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_two_circles.m)
%
% Choose a value for a
% choose a vector of values for r such that 0<r<a-1
a         =   4;
rv        =  [0.01,0.05,0.15:0.075:2.85,2.9,2.95,2.99];
% choose a value for n
n         =   2^10;
% compute the capacity
t         =  (0:2*pi/n:2*pi-2*pi/n).';
for itr=1:length(rv)
    r = rv(itr);
    et(1:n,1)        =       exp(-i.*t);
    etp(1:n,1)       =   -i.*exp(-i.*t);
    et(n+1:2*n,1)    =  a+r.*exp(-i.*t);
    etp(n+1:2*n,1)   = -r*i.*exp(-i.*t);
    [~,app_cap] =  annq (et,etp,n,0,a,'u')
    exact_q     =  2/(1+sqrt(1-4*r/((1+a-r)*(a+r-1))))-1;
    exact_cap   =  2*pi/log(1/exact_q);
    rerror(itr) =  abs(app_cap-exact_cap)/exact_cap;  
end
% plot the figure
figure
plot(rv,log10(rerror),'-b','LineWidth',1)

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[0:1:3],'FontSize',18);
set(gca,'YTick',[-16:1:-13]);
axis([0 3 -16 -13])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_cir_af
% print -depsc fig_two_cir_af
%

