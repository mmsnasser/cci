% example_two_slits_error_table.m
% Nasser, June 11, 2019
clc;clear; 
% To compute the error in the cap([0,1],[c,d]) in Table 7
% in Section 7 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%%
% the vector of values of the constants c and d
cv    =  [1.1 ; 1.1 ; 1.1 ; 2  ; 2 ;  2 ];
dv    =  [2   ; 5   ; 10  ; 3  ; 5 ;  10];
% choose the value of n
n         =  2^11;
t         =   (0:2*pi/n:2*pi-2*pi/n).';
%
for kk=1:length(cv)
    c  =  cv(kk);  d  =  dv(kk);
    tic
    app_cap(kk,1)    = cap_of_two_slits(0,1,c,d,n,0.5,1e-14);
    time_num(kk,1)   =  toc; 
    tau              =  d.*(c-1)./(d-c);
    exact_cap(kk,1)  =  pi./mu(1./sqrt(1+tau));
    rerror(kk,1)     = abs(app_cap(kk,1)-exact_cap(kk,1))./exact_cap(kk,1);
end
%
format long g
[app_cap  exact_cap  rerror time_num]
%