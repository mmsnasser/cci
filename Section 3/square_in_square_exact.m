function cap  = square_in_square_exact(a)
% square_in_square_exact.m
% To compute the exact capacity of the square in square domain in
% Section 4.12 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
c    = (1-a)/(1+a);
u    =  invmu(pi*c/2);
v    =  invmu(pi/(2*c));
cap  = (8/pi)*mu(2*u*v);
%
%
end