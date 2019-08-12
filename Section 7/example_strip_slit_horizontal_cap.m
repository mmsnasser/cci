% example_strip_slit_horizontal_cap.m
% Nasser, June 15, 2019
clc;clear; 
% To compute cap(S\[-s,s]) for 0.05<=s<=1.5.
% The capacity is plotted in the file
% example_strip_slit_cap_plot.m
% to plot Figure 28 in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
ratio     =  0.1;
%
sv = [0.05,0.075,0.1:0.05:1.5].';
%
for k=1:length(sv)                
    %
    s     =  sv(k);
    a     = -s;     b  =  s; % The two end of the segment [a,b] in the strip -pi/2<Im z<pi/2
    app_cap(k,1)  =  cap_of_strip_slit(a,b,n,ratio,1e-14);
end
%
[sv app_cap]
%