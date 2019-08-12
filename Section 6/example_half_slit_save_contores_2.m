% example_half_slit_save_contores_2.m
% Nasser, June 16, 2019
clc;clear; 
%
% To generate the data files 
% x2_pt.mat, y2_pt.mat, u2_pt.mat
% which used by the file
% example_half_slit_plot_contores_2.m
% to plot Figure 25 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
n     =  2^12;  
ratio =  0.1;
z1    =  2i;
%
[X,Y]    =  meshgrid([-3.0:0.2:-0.2,-0.1,0,0.1,0.2:0.2:3.0],[0.05:0.1:3.05]);
Z        =  X+i*Y;
[mx,nx]  = size(Z);
%
figure
plot(real(Z),imag(Z),'or')
hold on
plot([-3 3],[0 0],'k','LineWidth',2)
plot(0,1,'+k')
%
for kx=1:mx
    for jx=1:nx
        z = Z(kx,jx);
        z
        u(kx,jx) =cap_of_half_slit(z1,z,n,ratio,1e-14);
    end
end
%
save('x2_pt.mat', 'X', '-ascii', '-double');
save('y2_pt.mat', 'Y', '-ascii', '-double');
save('u2_pt.mat', 'u', '-ascii', '-double');
%