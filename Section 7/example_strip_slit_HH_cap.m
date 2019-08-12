% example_strip_slit_HH_cap.m
% horizontal movment, horizontal segment
% Nasser, June 15, 2019
clc;clear; 
% To compute cap(S\[s-0.5,s+0.5]) for -4<=s<=4.
% The capacity is plotted in the file
% example_strip_slit_cap_plot.m
% to plot Figure 27 (right) in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
ratio     =  0.1;
%
sv = [-4.0:0.5:4.0].';  
%
for k=1:length(sv)
    s            =  sv(k);
    a            = s-0.5;  b  =  s+0.5; % The two end of the segment [a,b] in the strip -pi/2<Im z<pi/2
    app_cap(k,1) =  cap_of_strip_slit(a,b,n,ratio,1e-14);
end
%
[sv app_cap]
%