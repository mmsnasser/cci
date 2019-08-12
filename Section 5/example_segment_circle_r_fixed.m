% example_segment_circle_a_fixed.m 
% Nasser, June 10, 2019
clear;clc
% This code plots the figure in Figure 8 (left) of the segment and circle 
% domain in Section 5.1 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: example_segment_circle.m)
%
% Choose a value for r
% choose a vector of values for a such that a>1+r>1
av        =  [2.05,2.07,2.1,2.14,2.2,2.3,2.4,2.6,2.9,3.2,3.5:0.5:6.5];
r         =   1;
% choose the value of n
n         =   2^11;
%
t         =   (0:2*pi/n:2*pi-2*pi/n).';
for itr=1:length(av)
    a    =  av(itr);    
    
    Phi     = @(z)(1./((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2))));
    Phip    = @(z)(4./(1-1./(Phi(z).^2)));
    Phiinv  = @(z)(0.25.*(z+1./z)+0.5);
    
    eto  =  a+r.*exp(-i.*t);
    etop = -i*r.*exp(-i.*t);
    
    et(1:n,1)        =  exp(i.*t);
    etp(1:n,1)       =  i.*exp(i.*t);
    et(n+1:2*n,1)    =  Phi(eto);
    etp(n+1:2*n,1)   =  Phip(eto).*etop;
    alpha1  = 0.5*(max(real(et(n+1:2*n,1)))+1);
    alpha2  = 0.5*(min(real(et(n+1:2*n,1)))-1);
    if abs(alpha1)>abs(alpha2)
        alpha=alpha2;
    else
        alpha=alpha1;
    end
    z2  =  0.5*(max(real(et(n+1:2*n,1)))+min(real(et(n+1:2*n,1))))+...
          0.5i*(max(imag(et(n+1:2*n,1)))+min(imag(et(n+1:2*n,1))));
    
    [~,app_cap(itr)]  =  annq (et,etp,n,alpha,z2,'b');
    
    ex_t             =  r/(a^2-a-r^2);
    exact_cap(itr)   =  2*pi/mu(ex_t);
    rerror(itr)      =  abs(app_cap(itr)-exact_cap(itr))/exact_cap(itr);  
end
%
format short g
[av.'  app_cap.']
%
figure
plot(av,log10(rerror),'-b','LineWidth',1)

xlabel('{$a$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');

set(gca,'XTick',[2:1:6],'FontSize',18);
set(gca,'YTick',[-16:1:-12]);
axis([2 6 -16 -12])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_seg_cir_rf
% print -depsc fig_seg_cir_rf
%