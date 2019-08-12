% example_two_ellibses.m 
% Nasser, June 9, 2019
clc;clear
% This code compute the value of the capacity of the two circle domain in
% Section 4.1 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% 
% choose the values of the constants r1 and r2 where r1>r2>1
r1 =  4;  r2 = 2;
% choose the value of n
n  =  2^12
%
% 
t  = (0:2*pi/n:2*pi-2*pi/n).';
alpha = (0.5*(r1+1/r1)+0.5*(r2+1/r2))/2; % alpha is a point in the domain G
z2    =  0; % z2 is a point interior to the inner curve
% parametrization of the boundary
et(1:n,1)        =  0.5.*(r1*  exp(i.*t)+(1/r1).*exp(-i.*t));
etp(1:n,1)       =  0.5.*(r1*i*exp(i.*t)-(i/r1).*exp(-i.*t));
et(n+1:2*n,1)    =  0.5.*(   r2*exp(-i.*t)+(1/r2).*exp(i.*t));
etp(n+1:2*n,1)   =  0.5.*(-r2*i*exp(-i.*t)+(i/r2).*exp(i.*t));
% compute the numerical value of the capacity using the function annq.m
[~,app_cap]      =  annq (et,etp,n,alpha,z2,'b')
%%
% compute the exact capacity and the error
exact_cap =  2*pi/log(r1/r2)
rerror    =  abs(app_cap-exact_cap)/exact_cap
% plot the domain
figure
hold on
box on
% fill([-7 -7 7 7],[6 -6 -6 6],[0.8 0.8 0.8])
% fill(real(et(1:n,1)),imag(et(1:n,1)),'w')
% fill(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),[0.8 0.8 0.8])

plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'b','LineWidth',1.2)

text(1.5,2, '{$E_1$}','FontSize',18,'Interpreter','latex');
text(0.2,0.2,'{$E_2$}','FontSize',18,'Interpreter','latex');
text(0.2,1.2,'{$G$}','FontSize',18,'Interpreter','latex');

plot(real(alpha),imag(alpha),'or','markerFaceColor','r')
plot(real(z2),imag(z2),'ob','markerFaceColor','b')

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

axis equal
axis([-2.5 2.5 -2.5 2.5])
box off

set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_ell
%%

