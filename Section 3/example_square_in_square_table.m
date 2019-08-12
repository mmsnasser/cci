% example_square_in_square_table.m
% Nasser, June 9, 2019
clear;clc
% This code compute the values in Table 1 of the square in square domain 
% in Section 4.12 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_square_in_square.m)
%
% choose a vector of values for a
av       =   [0.1:0.1:0.9];
% choose a value for n
n        =   2^17;
%
% compute the capacity
t        =  (0:2*pi/n:2*pi-2*pi/n).';
for itr=1:length(av)
    a=av(itr);
    out_ver    =  2.*[1+i   ; -1+i   ; -1-i    ;   1-i  ]; % Vertices of the outer polygon
    in_ver     =  2.*[a+a*i ;  a-a*i ;  -a-a*i ;  -a+a*i]; % Vertices of the inner polygon
    [et(1:n,1)    ,etp(1:n,1)    ] = polygonp(out_ver,n/length(out_ver));
    [et(n+1:2*n,1),etp(n+1:2*n,1)] = polygonp(in_ver,n/length(in_ver));
    alpha       =   a+1;
    z2          =  0;
    tic
    [~,app_cap(itr)] =  annq (et,etp,n,alpha,z2,'b');
    timevc(itr)=toc;
    exact_cap(itr) =  square_in_square_exact(a);
    rerror(itr) =  abs(app_cap(itr)-exact_cap(itr))/exact_cap(itr);  
end
%
format long g
[av.' app_cap.' exact_cap.' timevc.' rerror.']
%
figure
plot(av,log10(rerror),'-b','LineWidth',1)

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');

set(gca,'XTick',[0.1:0.2:0.9],'FontSize',18);
set(gca,'YTick',[-14:1:-12]);
axis([0.1 0.9 -14 -12])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_sq_sq19
% print -depsc fig_sq_sq19
%