% example_strip_slit_VV_cap.m
% vertical movment, vertical segment
% Nasser, June 15, 2019
clc;clear; 
% To compute cap(S\[(s-0.5)i,(s+0.5)i]) for -1.05<=s<=1.05.
% The capacity is plotted in the file
% example_strip_slit_cap_plot.m
% to plot Figure 27 (left) in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
%
sv = [-1.05:0.01:-1.0,-0.975:0.025:-0.9,-0.85:0.05:-0.7,-0.6:0.1:-0.1,...
        0.1:0.1:0.6,0.7:0.05:0.85,0.9:0.025:0.975,1.0:0.01:1.05].'; 
%
for k=1:length(sv)
    %
    s     =  sv(k);
    a     = (s-0.5)*i;  b  =  (s+0.5)*i;% The two end of the segment [a,b] in the strip -pi/2<Im z<pi/2
    %
    ratio = min(0.1,pi/2-0.5-abs(s));
    app_cap(k,1) =  cap_of_strip_slit(a,b,n,ratio,1e-14);
end
%
[sv app_cap]
%
