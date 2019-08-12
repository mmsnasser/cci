% example_two_slits_save_contores_0462.m
% Nasser, June 11, 2019
clc;clear; 
%
% To generate the data files 
% x04_pt.mat, y04_pt.mat, u0462_pt.mat
% which used by the file
% example_two_slits_plot_contores_0462.m
% to plot Figure 16 in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
z1=6+2i;
%
%
for k=1:17
    XY(:,k)=(k-1)/4+i.*[0.2,0.3,0.4,0.5:0.2:10].';
end
for k=18:49
    XY(:,k)=(k-1)/4+i.*[-0.1:0.2:10].';
end
[mx,nx] = size(XY);
figure
plot(real(XY),imag(XY),'or')
hold on
plot([0 4],[0 0],'k','LineWidth',2)
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
%
%
for kx=1:mx
    for jx=1:nx
        x = real(XY(kx,jx));
        y = imag(XY(kx,jx));
        [x+i*y z1]
        u(kx,jx) = cap_of_two_slits(0,4,x+i*y,z1,2^11,0.1,1e-14);
    end
end
%
x_XY = real(XY);
y_XY = imag(XY);
save('x04_pt.mat', 'x_XY', '-ascii', '-double');
save('y04_pt.mat', 'y_XY', '-ascii', '-double');
save('u0462_pt.mat', 'u',    '-ascii', '-double');
%