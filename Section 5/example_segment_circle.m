% example_segment_circle.m
% Nasser, June 10, 2019
clear;clc; 
% To compute the capacity of the the doubly connected domain in the 
% exterior of the segment [0,1] and the circle |z-a|=r where r>0 and a is a
% real number with a>1+r, 
%
% choose the value of r; the radius of the circle
tic
r    =   0.1;      
% choose the value of a; the center of the circle
a    =   1.2;    
% choose the value of n
n         =   2^11;
%
t         =  (0:2*pi/n:2*pi-2*pi/n).';
% Define the function Psi and its inverse (as in Section 5.1) 
Psi      = @(z)(0.25.*(z+1./z)+0.5);
Psiv     = @(z)(1./((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2))));
Psivp    = @(z)(4./(1-1./(Psiv(z).^2)));
% Parametrization of the orgional circle
eto  =  a+r.*exp(-i.*t);
etop = -i*r.*exp(-i.*t);
% Parametrization of the outer circle in the image domain
et(1:n,1)        =  exp(i.*t);
etp(1:n,1)       =  i.*exp(i.*t);
% Parametrization of the inner curve in the image domain
et(n+1:2*n,1)    =  Psiv(eto);
etp(n+1:2*n,1)   =  Psivp(eto).*etop;
% Find alpha in the domain
alpha1  = 0.5*(max(real(et(n+1:2*n,1)))+1);
alpha2  = 0.5*(min(real(et(n+1:2*n,1)))-1);
if abs(alpha1)>abs(alpha2)
    alpha=alpha2;
else
    alpha=alpha1;
end
% Find z2 in the interior of the inner curve
z2  = 0.5*(max(real(et(n+1:2*n,1)))+min(real(et(n+1:2*n,1))))+...
      0.5i*(max(imag(et(n+1:2*n,1)))+min(imag(et(n+1:2*n,1))));
% compute the numerical value of the capacity using the function annq.m
[~,app_cap] =  annq (et,etp,n,alpha,z2,'b');
time_numerical = toc
% compute the exact capacity and the error
ex_t        =  r/(a^2-a-r^2);
exact_cap   =  2*pi/mu(ex_t);
rerror      =  abs(app_cap-exact_cap)/exact_cap;
format long g
app_cap
exact_cap
format short e
rerror
% Plot the original domain
figure
hold on
box on
k=1; crv   =  Psi(et((k-1)*n+1:k*n,1));crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'r','LineWidth',1)
k=2; crv   =  Psi(et((k-1)*n+1:k*n,1));crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k','LineWidth',1)
axis equal
axis([-0.05 3.0 -0.95 0.95])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_seg_cir_f
% print -depsc fig_seg_cir_f
% Plot the image domain 
figure
hold on
box on
k=1;crv   =  et((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'r','LineWidth',1)
k=2;crv   =  et((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k','LineWidth',1)
axis equal
axis([-1.05 1.05 -1.05 1.05])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_seg_cir_fi
% print -depsc fig_seg_cir_fi
%%