% example_strip_slit_save_contores_2.m
% Nasser, June 16, 2019
clc;clear; 
%
% To generate the data files 
% x2_pt.mat, y2_pt.mat, u2_pt.mat
% which used by the file
% example_strip_slit_plot_contores_2.m
% to plot Figure 30 in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
n     =  2^12;  
ratio =  0.1;
z1    =  i;
%
[X,Y]    =  meshgrid([-3.0:0.2:-0.2,-0.1,0,0.1,0.2:0.2:3.0],[-1.52,-1.45:0.1:1.05,1.1:0.05:1.5,1.52]);
Z        =  X+i*Y;
[mx,nx]  = size(Z);
%
figure
plot(real(Z),imag(Z),'or')
hold on
plot([-3 3],[-pi/2  -pi/2],'k','LineWidth',2)
plot([-3 3],[+pi/2  +pi/2],'k','LineWidth',2)
plot(0,0,'+k')
axis equal
%
%
for kx=1:mx
    for jx=1:nx
        z = Z(kx,jx);
        z
        u(kx,jx) = cap_of_strip_slit(z1,z,n,ratio,1e-14);
    end
end
%
save('x2_pt.mat', 'X', '-ascii', '-double');
save('y2_pt.mat', 'Y', '-ascii', '-double');
save('u2_pt.mat', 'u', '-ascii', '-double');
%