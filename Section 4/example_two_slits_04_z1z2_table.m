% example_two_slits_04_z1z2_table.m
% Nasser, June 11, 2019
clc;clear; 
% To compute the values cap([0,4],[z1,z2]) in Table 9
% in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
z1      =  [6+2*i 6+i*4 6+i*6]; 
z2      =  1+i.*[1:5];
%
n       =  2^11;
t       = (0:2*pi/n:2*pi-2*pi/n).';
%
for j=1:length(z1)
    for k=1:length(z2)
        u(k,j) = cap_of_two_slits(0,4,z1(j),z2(k),n,0.1,1e-14);
    end
end
%
format long 
u
%