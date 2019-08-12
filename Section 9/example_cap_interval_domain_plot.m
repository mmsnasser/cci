clc
clear
%
n        =   2^12
t        =  (0:2*pi/n:2*pi-2*pi/n).';
r        =   0.5;
%
et          =  0.25*r.*exp(-i.*t);
alpha       =  0;
figure
plot(real(et),imag(et),'k','LineWidth',1.5)
hold on
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
set(gca,'XTick',[-0.5:0.5:0.5],'FontSize',15);
set(gca,'YTick',[-0.5:0.5:0.5]);
axis equal
% axis([-0.5  0.5 -0.5  0.5])
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc LHEcap_int_clog
%
Phi1    = @(z,r)(z./r);
Phi1p   = @(z,r)(z-z+1./r);
Phi2    = @(z)(0.25.*(z+1./z)+0.5);
Phi2v   = @(z)((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2)));
Phi2vp  = @(z)(4./(1-1./(Phi2v(z).^2)));

et(1:n,1)      =     exp(i.*t);
zet(1:n,1)     =  Phi2v(Phi1(et(1:n,1),r));
zet(n+1:2*n,1)  =    exp(-i.*t);
alpha           =  Phi2v(Phi1(0.5i,r));
z2              =  0;
figure
crv=zet(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=zet(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
set(gca,'XTick',[-8:2:4],'FontSize',15);
set(gca,'YTick',[-6:2:6]);
axis equal
% axis([-8 4 -6 6])
set(gca,'LooseInset',get(gca,'TightInset'))
%
r        =   0.99;
Phi4    = @(z,tau)(z./tau);
Phi4p   = @(z,tau)(z-z+1./tau);
Phi2    = @(z)(0.25.*(z+1./z)+0.5);
Phi2v   = @(z)((2.*z-1).*(1+sqrt(1-1./(2.*z-1).^2)));
Phi2vp  = @(z)(4./(1-1./(Phi2v(z).^2)));

tau             = (r^2)/(2+r^2+2*sqrt(1+r^2));

et(1:n,1)       =     exp(i.*t);
zet(1:n,1)      =  Phi2v(Phi4(et(1:n,1),tau));
zet(n+1:2*n,1)  =    exp(-i.*t);
alpha           =  Phi2v(Phi4(0.5i,tau));
z2              =  0;

figure
crv=zet(1:n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
hold on
crv=zet(n+1:2*n); crv(n+1)=crv(1);
plot(real(crv),imag(crv),'k','LineWidth',1.5)
plot(real(alpha),imag(alpha),'pk','markerFaceColor','k')
plot(real(z2),imag(z2),'ok','markerFaceColor','k')
axis equal
% axis([-2.5 2 -3.5 1])
set(gca,'LooseInset',get(gca,'TightInset'))
% 