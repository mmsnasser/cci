% example_half_slit_figure_plot.m
% Nasser, June 16, 2019
clc;clear; 
% To plot Figure 21 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
% The two end of the segment [a,b] are in the strip -pi/2<Im z<pi/2
a         =  1-0.25i;  b  =  -1+1i;
%plot the original domain
figure;
plot([-3 3],[-pi/2  -pi/2],'r','LineWidth',1)
hold on
plot([-3 3],[+pi/2  +pi/2],'r','LineWidth',1)
plot(real([a b]),imag([a b]),'k','LineWidth',1)
plot(real(a),imag(a),'ok','MarkerFaceColor','k')
plot(real(b),imag(b),'ok','MarkerFaceColor','k')

text(+1.10,-0.25,'{$a$}','FontSize',22,'Interpreter','latex');
text(-0.90,+1.10,'{$b$}','FontSize',22,'Interpreter','latex');
text(-0.90,-0.50,'{$\Omega$}','FontSize',22,'Interpreter','latex');

axis equal
axis([-3.0 3.0 -1.65 1.65])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc strip_fig_dom
% print -dpdf  strip_fig_dom
%
% Choose the value of n
n         =  2^11;
%This ratio, 0<ratio<=1 is require for computing the preimag domain.
% It is better to choose the ratio close to 1. However, when the two 
% slits are close to each other, we need to chose the ratio small but 
% not very small. May be >=0.01. But for small value we need to 
% increase the value of n
ratio     =  0.1;  
%
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [ 0        ; (a+b)/2     ];
Lk        =  [ 0        ;  abs(b-a)   ];
thetk     =  [ 0        ;  angle(b-a) ];
%
Phi          =   @(z)(log((1+z)./(1-z)));
Phip         =   @(z)(2./(1-z.^2));
Phiv         =   @(z)(1-2./(exp(z)+1));  %(exp(z)-1)./(exp(z)+1)
Phivp        =   @(z)(2.*exp(z)./((exp(z)+1).^2));  
%
cent     =  Lc;
radx     = (1-0.5*ratio).*Lk;
rady     =  ratio.*radx;
for k=2:2
    xt    =  cent(k)+0.5.*exp(i*thetk(k)).*(+radx(k).*cos(t)-i*rady(k).*sin(t));
    xtp   =          0.5.*exp(i*thetk(k)).*(-radx(k).*sin(t)-i*rady(k).*cos(t));    
end
%
%plot the intermidate domain
figure;
plot([-3 3],[-pi/2  -pi/2],'r','LineWidth',1)
hold on
plot([-3 3],[+pi/2  +pi/2],'r','LineWidth',1)
crv = xt; crv(n+1)  =  crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1)
text(-0.90,-0.50,'{$\hat\Omega$}','FontSize',22,'Interpreter','latex');
axis equal
axis([-3.0 3.0 -1.65 1.65])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc strip_fig_domc
% print -dpdf  strip_fig_domc
%
%
% Use the MATLAB function PreImageStripRec.m to compute the preimage domain
% bordered by the unit disk and a pseudellipse
[et , etp, wn , cent] = PreImageStripRec (Lc , Lk , thetk , ratio , n , 1e-14  , 100 );
%
%plot the preimage domain
figure
hold on
box on
k=1; crv = et((k-1)*n+1:k*n,1); crv(n+1)  =  crv(1);crv(abs(crv)>10)=NaN+i*NaN;
plot(real(crv),imag(crv),'r','LineWidth',1)
k=2; crv = et((k-1)*n+1:k*n,1); crv(n+1)  =  crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1)
text(-0.40,-0.40,'{$G$}','FontSize',22,'Interpreter','latex');
axis equal
axis([-1.05  1.05  -1.05  1.05])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc strip_fig_domi
% print -dpdf  strip_fig_domi
%%