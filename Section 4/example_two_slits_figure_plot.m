% example_two_slits_figure_plot.m
% Nasser, June 11, 2019
clc;clear; 
% To plot Figure 14 in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% the values of your chosen constants a and b
a         =  1-i;
b         =  3+2i;
% Choose the value of n
n         =  2^11;
%This ratio, 0<ratio<=1 is require for computing the preimag domain.
% It is better to choose the ratio close to 1. However, when the two 
% slits are close to each other, we need to chose the ratio small but 
% not very small. May be >=0.01. But for small value we need to 
% increase the value of n
ratio     =  0.2;  
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [0.5       ; (a+b)/2     ];
Lk        =  [ 1        ;  abs(b-a)   ];
thetk     =  [ 0        ;  angle(b-a) ];
m         =   length(thetk);
%
% Use the MATLAB function PreImageStrSlit.m to compute the preimage domain
% bordered by ellipses
%
[cent , radx , fet] = PreImageStrSlit (Lc , Lk , thetk , ratio , n , 1e-14  , 100 );
rady        =   ratio.*radx;
for k=1:m
    et(1+(k-1)*n:k*n,1)    =  cent(k)+0.5.*exp(i*thetk(k)).*(+radx(k).*cos(t)-i*rady(k).*sin(t));
    etp(1+(k-1)*n:k*n,1)   =          0.5.*exp(i*thetk(k)).*(-radx(k).*sin(t)-i*rady(k).*cos(t));    
end
%
%
figure;
hold on
box on
plot([0 1],[0 0],'r','LineWidth',1)
plot([real(a) real(b)],[imag(a) imag(b)],'k','LineWidth',1)
axis([-0.1 3.1 -1.1 2.1])
axis equal
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_two_seg_f
%
figure;
hold on
box on
k=1;c_cr    =  et((k-1)*n+1:k*n,1); c_cr(n+1)  =  c_cr(1);
plot(real(c_cr),imag(c_cr),'r','LineWidth',1)
k=2;c_cr    =  et((k-1)*n+1:k*n,1); c_cr(n+1)  =  c_cr(1);
plot(real(c_cr),imag(c_cr),'k','LineWidth',1)
axis equal
axis([-0.1 3.1 -1.1 2.1])
axis equal
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_two_seg_fi
%
