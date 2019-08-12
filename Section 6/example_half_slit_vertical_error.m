% example_half_slit_vertical_error.m
% Nasser, June 15, 2019
clc;clear; 
% To compute the error in the cap(H^2\[si,(1+s)i]) for 0.05<=s<=6.
% The error is plotted in the file
% example_half_slit_cap_error_plot.m
% to plot Figure 22 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n    =  2^11;  
%
% the vector of values of s
sv   = [0.05,0.2:0.2:6].';
%
for k=1:length(sv)
    %
    s     =  sv(k);
    ratio =  min(s,0.1);
    a     =  i*s; b  =  i*(1+s); % The two end of the segment [a,b] in the upper half-plane 
    %
    app_cap(k,1)   =  cap_of_half_slit(a,b,n,ratio,1e-14);
    %
    tu             =  tanh((1/2)*log(abs(b/a)));
    exact_cap(k,1) =  2*pi/mu(tu);
    rerror(k,1)    =  abs(app_cap(k,1)-exact_cap(k,1))/exact_cap(k,1); 
end
%
format long g
[sv rerror]
%