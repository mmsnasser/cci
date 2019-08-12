function app_cap = cap_of_strip_slit(a,b,n,ratio,tol)
% cap_of_strip_slit.m
% Nasser, June 16, 2019
% This function computes cap(Omega) where Omega=S\[a,b], S is the strip
% |Im z|<pi/2, and a and b are complex numbers in S; and ratio, 0<ratio<=1
% is require for computing the preimag domain. It is better to choose the
% ratio close to 1. However, when the the slit is close to the real line,
% we need to chose the ratio small but not very small, maybe >=0.01. For
% small value we need to increase the value of n     
%
%
%
t         =   (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [ 0        ; (a+b)/2     ];
Lk        =  [ 0        ;  abs(b-a)   ];
thetk     =  [ 0        ;  angle(b-a) ];
%
Phi          =   @(z)(log((1+z)./(1-z)));
Phip         =   @(z)(2./(1-z.^2));
Phiv         =   @(z)(1-2./(exp(z)+1));  %(exp(z)-1)./(exp(z)+1)
Phivp        =   @(z)(2.*exp(z)./((exp(z)+1).^2));  
%
[et , etp , cent] = PreImageStripRec (Lc , Lk , thetk , ratio , n , tol  , 100 );
%
alpha       =  0.5*(max(real(et(n+1:2*n,1)))+1);
z2          =  Phiv(cent(2));
[~,app_cap] =  annq (et,etp,n,alpha,z2,'b');
end