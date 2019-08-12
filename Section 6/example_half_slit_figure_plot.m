% example_half_slit_figure_plot.m
% Nasser, June 16, 2019
clc;clear; 
% To plot Figure 21 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% the values of your chosen constants a and b
a     =  1+0.5i; 
b     = -1+1.5i; 
% Choose the value of n
n         =  2^11;
%This ratio, 0<ratio<=1 is require for computing the preimag domain.
% It is better to choose the ratio close to 1. However, when the two 
% slits are close to each other, we need to chose the ratio small but 
% not very small. May be >=0.01. But for small value we need to 
% increase the value of n
ratio     =  0.1;  
%plot the original domain
%
figure
hold on
box on
plot([-3 3],[0 0],'r','LineWidth',1.2)
plot(real([a b]),imag([a b]),'k','LineWidth',1.2)
plot(real(a),imag(a),'ok','MarkerFaceColor','k')
plot(real(b),imag(b),'ok','MarkerFaceColor','k')
text(+1.10,+0.5,'{$a$}' ,'FontSize',20,'Interpreter','latex');
text(+0.90,+1.50,'{$\Omega$}','FontSize',20,'Interpreter','latex');
text(-0.95,+1.65,'{$b$}','FontSize',20,'Interpreter','latex');
axis equal
axis([-3  3  -0.5  3.0])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc half_fig_dom
% print -dpdf  half_fig_dom
%
%
ha        =    a;  hb  = b;
c         =   (ha+hb)/2+i;
map1      =   @(z)((z-real(c))./imag(c));
Psi       =  @(z)(1i.*(2i./(i-z)-1)); %i(i+z)/(i-z)
Psip      =  @(z)((-2./((i-z).^2)));
Psiv      =  @(z)(i+2./(i+z));
Psivp     =  @(z)(-2./((i+z).^2));
a         =   map1(ha);
b         =   map1(hb);
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [ 0        ; (a+b)/2     ];
Lk        =  [ 0        ;  abs(b-a)   ];
thetk     =  [ 0        ;  angle(b-a) ];
% Use the MATLAB function PreImageStrSlit.m to compute the preimage domain
% bordered by the unit disk and a pseudellipse
[et , etp, cent] = PreImageHalfPlaneRec (Lc , Lk , thetk , ratio , n , 1e-14  , 100 );
%plot the preimage domain
figure
hold on
box on
k=1; crv = et((k-1)*n+1:k*n,1); crv(n+1)  =  crv(1);crv(abs(crv)>10)=NaN+i*NaN;
plot(real(crv),imag(crv),'r','LineWidth',1.2)
k=2; crv = et((k-1)*n+1:k*n,1); crv(n+1)  =  crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.2)
text(+0.30,+0.30,'{$G$}','FontSize',20,'Interpreter','latex');
axis equal
axis([-1.05  1.05  -1.05  1.05])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc half_fig_domi
% print -dpdf  half_fig_domi
%
