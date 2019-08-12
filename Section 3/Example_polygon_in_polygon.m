% Example_polygon_in_polygon.m
% Nasser, June 9, 2019
clc;clear; 
% To compute the capacity of the polygon in polygon domain in
% Section 4.13 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
% choose the number of vertices of the polygon
m          =  5  
% choose the value of q
q          =  0.5;
out_ver    =  exp(i.*[0:2*pi/m:2*pi-2*pi/m].'); % Vertices of the outer polygon
in_ver     =  q.*exp(-i.*[0:2*pi/m:2*pi-2*pi/m].'); % Vertices of the inner polygon
% choose the value of n where n shoud b a multiple of the number of verices
% in the inner and the outer polygon
n          =  9*5*7*2^7; 
%
t          = (0:2*pi/n:2*pi-2*pi/n).';
%  The parametization of external the triangle
[et(1:n,1)    ,etp(1:n,1)    ] = polygonp(out_ver,n/length(out_ver));
%  The parametization of internal the triangle
[et(n+1:2*n,1),etp(n+1:2*n,1)] = polygonp(in_ver,n/length(in_ver));
alpha            =  0.5*(q+1); % a point in the domain G
z2               =  0; % a point interior to the inner square
% compute the numerical value of the capacity using the function annq.m
tic
[~,app_cap] =  annq (et,etp,n,alpha,z2,'b')
toc
% the exact capacity of the annulus q<|z|<1
ann_cap     =  2*pi/log(1/q)
% plot the domain
figure
hold on
box on
for k=1:2
    crv   =  et((k-1)*n+1:k*n,1);crv(n+1) = crv(1); 
    plot(real(crv),imag(crv),'k','LineWidth',1)
end
crv   =    exp(i.*t);crv(n+1) = crv(1);
plot(real(crv),imag(crv),'b','LineWidth',1)
crv   =  q.*exp(i.*t);crv(n+1) = crv(1);
plot(real(crv),imag(crv),'b','LineWidth',1)

plot(real(out_ver),imag(out_ver),'ok')
plot(real(in_ver),imag(in_ver),'ok')
set(gca,'XTick',[-1:1:1],'FontSize',18);
set(gca,'YTick',[-1:1:1]);
axis equal
axis([-1.0 1.0 -1.0 1.0])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -dpdf  fig_pg5
% print -depsc fig_pg5
%