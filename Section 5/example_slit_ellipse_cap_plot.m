% example_slit_ellipse_cap_plot.m
% Nasser, June 22, 2019
clc;clear; 
% To plot Figure 52 in Section 15 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% the values of your chosen constants a, b, c, and d
c         =  1.5;
d         =  3.5;
a         = (d+c)/2;
b         = (d-c)/2;
%
% Chose a vector of values for r, 0<=r<=1.
rv        =  [0:0.025:b]';
for k=1:length(rv)
    r     =  rv(k);
    % compute tau_r as given in Section 15.
    tau   =  2*(d-c+2*r)*(1+sqrt(d*c+r^2)-sqrt(d*c-d-c+1+r^2))...
        /((d+c+2*sqrt(d*c+r^2))*(d+c-2+2*sqrt(d*c-d-c+1+r^2))-(d-c+2*r)^2);
    % compute the exact capacity 
    cap(k)=  2*pi./mu(tau);
end
%
%
figure
plot(rv,cap,'-k','LineWidth',1)
xlabel('{$r$}','FontSize',15,'Interpreter','latex');
ylabel('{$\mathrm{cap}(E,F_r)$}','FontSize',15,'Interpreter','latex');

set(gca,'XTick',[0:0.5:b],'FontSize',15);
set(gca,'YTick',[2:0.5:3]);
axis([0 b 2 3])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_slit_ellipse_r
%