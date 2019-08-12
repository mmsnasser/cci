% example_two_circles.m 
% Nasser, June 9, 2019
clear;clc
% This code compute the value of the capacity of the two circle domain in
% Section 4.1 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% 
% choose the values of the constants a and r where r>0 and a>1+r
r         =   2;
a         =   4;
% choose the value of n
n         =   2^10;
% compute the numerical value of the capacity
t         =  (0:2*pi/n:2*pi-2*pi/n).';
% parametrization of the boundary
et(1:n,1)        =       exp(-i.*t);
etp(1:n,1)       =   -i.*exp(-i.*t);
et(n+1:2*n,1)    =  a+r.*exp(-i.*t);
etp(n+1:2*n,1)   = -r*i.*exp(-i.*t);
% compute the numerical value of the capacity using the function annq.m
% where 0 is an interior point to the first curve and a is an interior 
% point to the second curve
[~,app_cap] =  annq (et,etp,n,0,a,'u');
% compute the exact capacity and the error
exact_q     =  2/(1+sqrt(1-4*r/((1+a-r)*(a+r-1))))-1
exact_cap   =  2*pi/log(1/exact_q)
rerror      =  abs(app_cap-exact_cap)/exact_cap
% plot the domain
figure
hold on
box on
for k=1:2
    crv   =  et((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
    plot(real(crv),imag(crv),'k','LineWidth',1)
end
axis equal
axis([-1.05 6.05 -3.0 3.0])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_two_cir
% print -depsc fig_two_cir
%%