% example_strip_slit_horizontal_table.m
% Nasser, June 16, 2019
clc;clear; 
% To compute the values cap(S\[0,s]) in Table 11
% in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
% The right end of the segment [0,s] in the strip -pi/2<Im z<pi/2
sv   =  [0.1  0.5  1  2  3  5].';
%
n         =  2^11;
ratio     =  0.1;
%                   
for k=1:length(sv)
    s              =  sv(k);
    tic
    app_cap(k,1)   =  cap_of_strip_slit(0,s,n,ratio,1e-14);
    time_num(k,1)  =  toc;
    tu             =  tanh(s/2);
    exact_cap(k,1) =  2*pi/mu(tu);
    rerror(k,1)    =  abs(app_cap(k,1)-exact_cap(k,1))/exact_cap(k,1); 
end
%
format long g
[sv  app_cap  exact_cap  rerror  time_num]
%