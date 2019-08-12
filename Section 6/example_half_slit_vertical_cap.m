% example_half_slit_vertical_cap.m
% Nasser, June 15, 2019
clc;clear; 
% To compute cap(H^2\[(3-s)i,(3+s)i]) for 0.05<=s<=2.95.
% The capacity is plotted in the file
% example_half_slit_cap_error_plot.m
% to plot Figure 23 in Section 8 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
% choose the value of n
n         =  2^11;
%
% the vector of values of s
sv   = [0.05,0.075,0.1,0.15,0.2:0.1:2.7,2.75,2.8,2.85:0.025:2.95].'; 
%
for k=1:length(sv)
    %
    s     =  sv(k);
    a  =  (3-s)*i; b  =  (3+s)*i; % The two end of the segment [a,b] in the upper half-plane
    ratio     =  min(0.1,(3-s)/6);  
    %
    app_cap(k,1)   =  cap_of_half_slit(a,b,n,ratio,1e-14);
end
%
[sv app_cap]
%