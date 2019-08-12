% example_half_slit_vertical_table.m
% Nasser, June 16, 2019
clc;clear; 
% To compute the values cap(H^2\[si,ri]) in Table 10
% in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
sv  =  [0.1, 0.1 , 0.1 , 1 , 1 , 1 ];
rv  =  [1  , 5   , 10  , 2 , 5 , 10];
n         =  2^11;
ratio     =  0.1;  
%
a  =  0+i; b  =  1+i; % The two end of the segment [a,b] in the upper half-plane
%
for k=1:length(sv)
    a  = sv(k)*i;  b =  rv(k)*i;
    tic
    app_cap(k,1)   =  cap_of_half_slit(a,b,n,ratio,1e-14);
    time_num(k,1)  =  toc;
    tu             =  tanh((1/2)*log(abs(b/a)));
    exact_cap(k,1) =  2*pi/mu(tu);
    rerror(k,1)    =  abs(app_cap(k,1)-exact_cap(k,1))/exact_cap(k,1); 
end
%
format long g
[sv.' rv.' app_cap exact_cap rerror time_num]
%