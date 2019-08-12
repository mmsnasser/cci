function app_cap = cap_of_two_slits(a,b,c,d,n,ratio,tol)
% cap_of_two_slits.m
% Nasser, June 11, 2019
% This function computes cap([a,b],[c,d]) where a,b,c,d are complex 
% numbers such that the segments [a,b] and [c,d] are disjoints; and 
% ratio, 0<ratio<=1 is require for computing the preimag domain. It is 
% better to choose the ratio close to 1. However, when the two slits are 
% close to each other, we need to chose the ratio small but not very 
% small, maybe >=0.01. For small value we need to increase the value of n
% 
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [(a+b)/2          ; (c+d)/2     ];
Lk        =  [ abs(b-a)        ;  abs(d-c)   ];
thetk     =  [ angle(b-a)      ;  angle(d-c) ];
%
% Use the MATLAB function PreImageStrSlit.m to compute the preimage
% domain bordered by ellipses
[et , etp , cent] = PreImageStrSlit (Lc , Lk , thetk , ratio , n , tol , 100 );
% Use the MATLAB function annq.m to compute the capacity of the unbounded
% domain bordered by ellipses
[~,app_cap] =  annq (et,etp,n,cent(1),cent(2),'u');
end