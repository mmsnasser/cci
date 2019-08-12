function app_cap = cap_of_half_slit(ha,hb,n,ratio,tloerance)
% cap_of_half_slit.m
% Nasser, June 16, 2019
% This function computes cap(Omega) where Omega=H^2\[a,b], H^2 is the upper
% half-plane, and a and b are complex numbers in H^2; and ratio, 0<ratio<=1
% is require for computing the preimag domain. It is better to choose the
% ratio close to 1. However, when the the slit is close to the real line,
% we need to chose the ratio small but not very small, maybe >=0.01. For
% small value we need to increase the value of n     
%     
c         =   (ha+hb)/2+sign(sign(real(ha-hb))+1e-15)+i;
map1      =   @(z)((z-real(c))./imag(c));
Psi       =  @(z)(1i.*(2i./(i-z)-1)); %i(i+z)/(i-z)
Psip      =  @(z)((-2./((i-z).^2)));
Psiv      =  @(z)(i+2./(i+z));
Psivp     =  @(z)(-2./((i+z).^2));
%
a         =   map1(ha);  b         =   map1(hb);
t         =  (0:2*pi/n:2*pi-2*pi/n).';
Lc        =  [0 ; (a+b)/2]; Lk = [0 ; abs(b-a)]; thetk = [0 ; angle(b-a)];
% Use the MATLAB function PreImageHalfPlaneRec.m to compute the preimage
% domain bordered by the unit circle and a pseudellipse
[et,etp,cent] = PreImageHalfPlaneRec(Lc,Lk,thetk,ratio,n,tloerance,100);
alpha       =  0.5*(max(real(et(n+1:2*n,1)))+1);
z2          =  Psiv(cent(2));
% Use the MATLAB function annq.m to compute the capacity of the bounded
% domain bordered by ellipses
[~,app_cap] =  annq (et,etp,n,alpha,z2,'b');
end