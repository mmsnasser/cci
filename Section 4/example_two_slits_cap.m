% example_two_slits_error_table.m
% Nasser, June 11, 2019
clc;clear; 
% To compute the error in the cap([0,1],[c,d]) in Table 7
% in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%%
A1    =   i;
A2    =   3+3i;
A3    =  -i;
A4    =   3-3i;
%
format long g
app_cap    = cap_of_two_slits(A1,A2,A3,A4,2^10,0.1,1e-14)
%
%