% example_strip_slit_VH_cap.m
% vertical movment, horizontal segment
% Nasser, June 15, 2019
clc;clear; 
% To compute cap(S\[-0.5+si,0.5+si]) for -1.55<=s<=1.55.
% The capacity is plotted in the file
% example_strip_slit_cap_plot.m
% to plot Figure 27 (left) in Section 9 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
%
sv   = [-1.55:0.01:-1.5,-1.475:0.025:-1.4,-1.35:0.05:-1.2,-1.1:0.1:-0.6,...
         -0.5:0.2:0.5,0.6:0.1:1.1,1.2:0.05:1.35,1.4:0.025:1.475,1.5:0.01:1.55].'; 
%
for k=1:length(sv)
    %
    s     =  sv(k);
    a     = -0.5+s*i;  b  =  0.5+s*i;% The two end of the segment [a,b]  in the strip -pi/2<Im z<pi/2
    %
    ratio     =  min(0.1,pi/2-abs(s));
    app_cap(k,1) =  cap_of_strip_slit(a,b,n,ratio,1e-14);
end
%
[sv app_cap]
%
