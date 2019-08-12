% example_two_slits_error.m
% Nasser, June 11, 2019
clc;clear; 
% To compute the error in the cap([0,1],[c,d]) for two cases: 
% 1) c=2;  2) c=d-1
% for 2.1<=d<=10.
% The error is plot in the file
% example_two_slits_error_plot.m
% to plot Figure 15 in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
t         =   (0:2*pi/n:2*pi-2*pi/n).';
% the vector of values of d
dv        = [2.1:0.5:10.1];
%
for itr=1:length(dv)
    d=dv(itr);
    % chose the value of c; two cases; 1) c=2;  2) c=d-1 
%     c         =  2;  % Case c=2
    c         =  d-1;  % case  c=d-1
    app_cap = cap_of_two_slits(0,1,c,d,n,0.5,1e-14);
    tau        =  d.*(c-1)./(d-c);
    exact_cap  =  pi./mu(1./sqrt(1+tau));
    abs(app_cap-exact_cap)./exact_cap
    rerror(itr)   =  abs(app_cap-exact_cap)./exact_cap;  
end
%
format short g
[dv.' rerror.']
%
figure
plot(dv,log10(rerror),'-b')

xlabel('{$r$}','FontSize',15,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',15,'Interpreter','latex');
set(gca,'XTick',[2:1:10],'FontSize',15);
set(gca,'YTick',[-16:1:-13]);
axis([2 10 -16 -13])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
%