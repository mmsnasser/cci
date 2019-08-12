% example_square_in_square.m
% Nasser, June 9, 2019
clc;clear; 
% To compute the capacity of the square in square domain in
% Section 4.12 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% choose the value of a
a        =   0.9
% choose the value of n
n        =   2^17
% 
t        =  (0:2*pi/n:2*pi-2*pi/n).';
% The parametization of the boundary
out_ver    =  2.*[1+i   ; -1+i   ; -1-i    ;   1-i  ]; % Vertices of the outer polygon
in_ver     =  2.*[a+a*i ;  a-a*i ;  -a-a*i ;  -a+a*i]; % Vertices of the inner polygon
[et(1:n,1)    ,etp(1:n,1)    ] = polygonp(out_ver,n/length(out_ver));
[et(n+1:2*n,1),etp(n+1:2*n,1)] = polygonp(in_ver,n/length(in_ver));
alpha       =   a+1; % a point in the domain G
z2          =  0; % a point interior to the inner square
% compute the numerical value of the capacity using the function annq.m
tic
[~,app_cap] =  annq (et,etp,n,alpha,z2,'b')
time_numerical=toc
% compute the exact capacity and the error
tic
% Here, we do not use MATLAB symbolic computation. The obtained results 
% are not accurate if a close to 1
exact_cap  =  square_in_square_exact(a)
time_exact=toc
rerror    =  abs(app_cap-exact_cap)/exact_cap
% plot the domain
figure
hold on
plot(real(et(1:n,1)),imag(et(1:n,1)),'k','LineWidth',1.2)
plot(real(et(n+1:2*n,1)),imag(et(n+1:2*n,1)),'k','LineWidth',1.2)
axis equal
axis([-2.01 2.01 -2.01 2.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_sq5
% print -depsc fig_sq5
%