function [et , etp , cent , wet] = PreImageStripRec (Lc , Lk , thetk , ratio , n , tloerance  , Maxiter )
% PreImageStripRec.m
% Nasser, June 16, 2019
% Let Omega be the strip |Im z|<pi/2 slitted along m segments slits where
% m=length(thetk)-1 (i.e., Omega is an unbounded multiply connected domain 
% of connectivity m+1)
% Lc: is a vector of the center points of these slits
% Lc: is a vector of the length of these slits
% thetk: is a vector of the angles between these slits and the positive
% real line.
% 
% This function computes: et , etp , cent , wet; i.e., a preimage 
% bounded multiply connected domain G border by the unit disk and
% m pseudellipses interior to the unit disk:
% et: the parametruzation of the boundary of G. 
% etp: the derivative of et.
% cent: the center of the unit disk and the m-1 pseudellipses
% wet: the boundary values of the conformal mapping from G onto Omega,
% 
% ratio, 0<ratio<=1 is the ration of lengthg of minor axix to the major 
% axis of the ellipses. It is better to choose the ratio close to 1. 
% However, when the two slits are close to each other, we need to chose 
% the ratio small but not very small. May be >=0.01. But for small value 
% we need to increase the value of n.
% 
% n: the number of discretization points in each boundary component of G
% tolerance: is the tolerance of the iterative method
% Maxiter: is the maximum number of iterations for the iterative method
%
%
% This code of computing the preimage domain G and the conformal mapping
% is based on the iterative method presented in Section 8 in the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
Phi          =   @(z)(log((1+z)./(1-z)));
Phip         =   @(z)(2./(1-z.^2));
Phiv         =   @(z)(1-2./(exp(z)+1));  %(exp(z)-1)./(exp(z)+1)
Phivp        =   @(z)(2.*exp(z)./((exp(z)+1).^2));  
%
t             =   (0:2*pi/n:2*pi-2*pi/n).'; 
m             =   length(thetk)-1;
thet(1:n,1)   =   0;
for k=2:m+1
    thet(1+(k-1)*n:k*n,1)  =  thetk(k);
end
cent     =  Lc;
radx     = (1-0.5*ratio).*Lk;
rady     =  ratio.*radx;
%
et(1:n,1)   =   exp(i.*t);
etp(1:n,1)  =   i.*exp(i.*t);
et(1)=1; et(n/4+1)=i; et(n/2+1)=-1;
%
for k=2:m+1
    xt(1+(k-1)*n:k*n,1)    =  cent(k)+0.5.*exp(i*thetk(k)).*(+radx(k).*cos(t)-i*rady(k).*sin(t));
    xtp(1+(k-1)*n:k*n,1)   =          0.5.*exp(i*thetk(k)).*(-radx(k).*sin(t)-i*rady(k).*cos(t));    
end
%
for k=2:m+1
    et(1+(k-1)*n:k*n,1)    =  Phiv(xt(1+(k-1)*n:k*n,1));
    etp(1+(k-1)*n:k*n,1)   =  Phivp(xt(1+(k-1)*n:k*n,1)).*xtp(1+(k-1)*n:k*n,1);
end
%
alpha1        =  0.5*(max(real(et(n+1:2*n,1)))+1);
alpha2        =  0.5*(min(real(et(n+1:2*n,1)))-1);
if abs(alpha1)<abs(alpha2)
    alpha = alpha1;
else
    alpha=alpha2;
end
%
err = inf;
itr = 0;
while (err>tloerance)
    itr  =itr+1;  
    %
    for k=2:m+1
        xt(1+(k-1)*n:k*n,1)    =  cent(k)+0.5.*exp(i*thetk(k)).*(+radx(k).*cos(t)-i*rady(k).*sin(t));
        xtp(1+(k-1)*n:k*n,1)   =          0.5.*exp(i*thetk(k)).*(-radx(k).*sin(t)-i*rady(k).*cos(t));    
    end
    %
    for k=2:m+1
        et(1+(k-1)*n:k*n,1)    =  Phiv(xt(1+(k-1)*n:k*n,1));
        etp(1+(k-1)*n:k*n,1)   =  Phivp(xt(1+(k-1)*n:k*n,1)).*xtp(1+(k-1)*n:k*n,1);
    end
    %
    A            =  exp(i.*(pi/2-thet)).*(et-alpha);
    gam(1:n,1)   =  0;
    for k=2:m+1
        gam(1+(k-1)*n:k*n,1)   =  imag(exp(-i.*thet(1+(k-1)*n:k*n)).*(Phi(et(1+(k-1)*n:k*n))));
    end
    %
    [mun , h ]  =  fbie(et,etp,A,gam,n,5,[],1e-14,100);
    fnet        = (gam+h+i.*mun)./A;
    f_of_i      =  fnet(n/4+1);
    for k=1:m+1
        wet(1+(k-1)*n:k*n,1) = Phi(et(1+(k-1)*n:k*n,1));
    end
    wet      =   wet+(et-alpha).*fnet-(i-alpha)*f_of_i;
    %
    rotwn           =  exp(-i.*thet).*wet;
    for k=2:m+1
        wnL         =  rotwn((k-1)*n+1:k*n,1);
        centk(k,1)  =  exp(i.*thetk(k)).*((max(real(wnL))+min(real(wnL)))/2+i.*(max(imag(wnL))+min(imag(wnL)))/2);     
        radk(k,1)   =  max(real(wnL))-min(real(wnL)); 
    end
    cent   =  cent-1.0.*(centk-Lc);
    radx   =  radx-(1-0.5*ratio).*(radk-Lk) ;
    rady   =  ratio.*radx;
    err    = (norm(centk-Lc,1)+norm(radk-Lk,1))/(m);
    [itr err];
    error (itr,1) = err;
    itrk  (itr,1) = itr;
    %
    if itr>=Maxiter
        'No convergence after Maximunm number of iterations'
        break;
    end
end
%
for k=2:m+1
    xt(1+(k-1)*n:k*n,1)    =  cent(k)+0.5.*exp(i*thetk(k)).*(+radx(k).*cos(t)-i*rady(k).*sin(t));
    xtp(1+(k-1)*n:k*n,1)   =          0.5.*exp(i*thetk(k)).*(-radx(k).*sin(t)-i*rady(k).*cos(t));    
end
for k=2:m+1
    et(1+(k-1)*n:k*n,1)    =  Phiv(xt(1+(k-1)*n:k*n,1));
    etp(1+(k-1)*n:k*n,1)   =  Phivp(xt(1+(k-1)*n:k*n,1)).*xtp(1+(k-1)*n:k*n,1);
end
A           =  exp(i.*(pi/2-thet)).*(et-alpha);
gam(1:n,1)   =  0;
for k=2:m+1
    gam(1+(k-1)*n:k*n,1)   =  imag(exp(-i.*thet(1+(k-1)*n:k*n)).*(Phi(et(1+(k-1)*n:k*n))));
end
[mun , h ]  =  fbie(et,etp,A,gam,n,5,[],1e-14,100);
fnet        = (gam+h+i.*mun)./A;
f_of_i      =  fnet(n/4+1);
for k=1:m+1
    wet(1+(k-1)*n:k*n,1) = Phi(et(1+(k-1)*n:k*n,1));
end
wet      =   wet+(et-alpha).*fnet-(i-alpha)*f_of_i;
%%
end