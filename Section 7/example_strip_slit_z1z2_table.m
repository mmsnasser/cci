% example_strip_slit_z1z2_table.m
% Nasser, June 17, 2019
clc;clear; 
% To compute the values cap(S\[z1,z2]) in Table 12
% in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
n     =  2^12;  
ratio =  0.1;
z2    = [-2:1:2]-1*i;
z1    = [0 i];
%
figure
hold on
plot([-3 3],[-pi/2  -pi/2],'k','LineWidth',2)
plot([-3 3],[+pi/2  +pi/2],'k','LineWidth',2)
plot(real(z1),imag(z1),'ok')
plot(real(z2),imag(z2),'or')
axis equal
%
for j=1:length(z1)
    for k=1:length(z2)
        cap(k,j) = cap_of_strip_slit(z1(j),z2(k),n,ratio,1e-14);
    end
end
%
cap
%