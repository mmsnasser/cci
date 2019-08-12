% example_cap_disk_plot.m
% Nasser, June 22, 2019
clear; clc
% To use the results obtained by the files
% example_cap_log_disk.m
% example_cap_hyp_disk.m
% example_cap_ell_disk.m
% 
% to plot Figure 46 in Section 14 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS 
%
%
%
%
Hyper = [
         0.02    1.785e-13
     0.053103   3.2144e-14
     0.086207   1.3667e-13
      0.11931   6.8743e-14
      0.15241   2.0396e-14
      0.18552   1.0218e-13
      0.21862   4.8244e-14
      0.25172   5.0941e-14
      0.28483   2.0464e-14
      0.31793   1.5016e-14
      0.35103   8.5393e-15
      0.38414   3.1936e-14
      0.41724    1.091e-14
      0.45034   2.3667e-14
      0.48345   4.0188e-15
      0.51655   6.6628e-15
      0.54966   2.4238e-15
      0.58276   2.2861e-15
      0.61586   7.3911e-15
      0.64897   3.8492e-14
      0.68207   4.8832e-16
      0.71517   1.3195e-14
      0.74828   7.4185e-15
      0.78138   1.9608e-14
      0.81448   2.7262e-16
      0.84759   6.2873e-15
      0.88069   7.6898e-15
      0.91379   3.7664e-15
       0.9469   1.5242e-15
         0.98   6.7973e-16
         ];
%
%           
elliptic = [
         0.01   1.0339e-13
     0.043793   4.4207e-14
     0.077586   1.9264e-13
      0.11138    2.953e-14
      0.14517   1.4148e-13
      0.17897   1.3183e-13
      0.21276   1.3019e-13
      0.24655   1.3768e-13
      0.28034   7.4056e-14
      0.31414   9.0122e-15
      0.34793   4.4035e-14
      0.38172    4.319e-14
      0.41552   5.3572e-14
      0.44931   5.3867e-14
       0.4831   3.1714e-14
       0.5169   1.3102e-14
      0.55069   8.2658e-15
      0.58448   7.0281e-15
      0.61828   3.4118e-15
      0.65207   3.1839e-14
      0.68586   5.1799e-15
      0.71966   2.5609e-14
      0.75345   1.1051e-14
      0.78724    1.241e-14
      0.82103   1.4874e-14
      0.85483   1.1429e-14
      0.88862   8.2459e-15
      0.92241   2.0461e-15
      0.95621   3.4832e-15
         0.99   1.1214e-16
         ];
%
%
figure
plot(Hyper(:,1),log10(Hyper(:,2)),'-sb','LineWidth',1)
hold on
plot(elliptic(:,1),log10(elliptic(:,2)),'-pr','LineWidth',1)

legend({'caph$(E)$','cape$(E)$'},'FontSize',15,'Interpreter','latex','Location','northwest');
xlabel('{$r$}','FontSize',15,'Interpreter','latex');
ylabel('{$\log_{10}$(Relative error)}','FontSize',15,'Interpreter','latex');

set(gca,'XTick',[0:0.25:1],'FontSize',15);
set(gca,'YTick',[-16:4:-8]);
axis([0 1 -16 -8])

grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;

set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc LHEcap_cir
%