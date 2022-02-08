clc
clear all 
close all
 
mDotc = [0.4, 0.5, 0.1, 0.2, 0.3]; % kg/s
mDoth = [0.275,0.275,0.275,0.275,0.275]; % kg/s
 
T_hi = [54.5,55.0,54.8,55.3,55.6];
T_co = [19.7,18.7,29.4,25,22.2];
T_ci = [12.4,12.5,12.9,12.9,12.9];
T_ho = [45.1,44.7,48.8,46.9,46.5];
 
T_ave_c = (T_co+T_ci)/2+273
T_ave_h = (T_hi+T_ho)/2+273
 
C_c = [4181, 4184, 4184, 4184, 4184];
C_h = [4182, 4182, 4182, 4182, 4182]; 
 
C_r1 = (0.063*4184)/(0.173*4182);
C_r2 = (0.126*4184)/(0.173*4182);
C_r3 = (0.173*4182)/(0.189*4184);
C_r4 = (0.173*4182)/(0.252*4184);
C_r5 = (0.173*4182)/(0.315*4184);
 
NTU = 0:0.25:5;
 
C_rtotal = [C_r1, C_r2, C_r3, C_r4, C_r5];
 
%eff = (1-exp(-NTU.*(1-C_rtotal)))./(1-C_rtotal.*exp(-NTU.*(1-C_rtotal)));
 
C_r1tot = [0.3643, 0.3643, 0.3643, 0.3643, 0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643,0.3643];
C_r2tot = [0.7287, 0.7287, 0.7287, 0.7287, 0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287,0.7287];
C_r3tot = [0.9149, 0.9149, 0.9149, 0.9149, 0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149,0.9149];
C_r4tot = [0.6862, 0.6862, 0.6862, 0.6862, 0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862,0.6862];
C_r5tot = [0.5489, 0.5489, 0.5489, 0.5489, 0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489,0.5489];
 
eff1 = (1-exp(-NTU.*(1-C_r1tot)))./(1-C_r1tot.*exp(-NTU.*(1-C_r1tot)));
eff2 = (1-exp(-NTU.*(1-C_r2tot)))./(1-C_r2tot.*exp(-NTU.*(1-C_r2tot)));
eff3 = (1-exp(-NTU.*(1-C_r3tot)))./(1-C_r3tot.*exp(-NTU.*(1-C_r3tot)));
eff4 = (1-exp(-NTU.*(1-C_r4tot)))./(1-C_r4tot.*exp(-NTU.*(1-C_r4tot)));
eff5 = (1-exp(-NTU.*(1-C_r5tot)))./(1-C_r5tot.*exp(-NTU.*(1-C_r5tot)));
 
% figure(1)
% plot(NTU, eff1)
% hold on
% plot(NTU, eff2)
% plot(NTU, eff3)
% plot(NTU, eff4)
% plot(NTU, eff5)
% xlabel('NTU')
% ylabel('Effectiveness')
% legend('C_r = 0.3643', 'C_r = 0.7287', 'C_r = 0.9149', 'C_r = 0.6862', 'C_r = 0.5489', 'location', 'southeast')
% hold off
 
 
C_cold = mDotc.*C_c;
C_hot = mDoth.*C_h;
 
qc = (mDotc.*C_c).*(T_co-T_ci)
qh = (mDoth.*C_h).*(T_hi-T_ho)
C_min = [263.4, 527.2, 723.486, 723.486, 723.486] 
qmax = C_min.*(T_hi-T_ci) 
effb = qh./qmax
effb2 = qc./qmax
eff_correct = [0.3776, 0.2643, 0.2202, 0.2360, 0.2442]
del_T1 =(T_hi - T_co) 
del_T2 = (T_ho-T_ci) 
del_log_mean = (del_T2-del_T1)./(log(del_T2./del_T1)) 
UA_c = qc./del_log_mean
UA_h = qh./del_log_mean
UA_correct = [136.7258, 183.0138, 203.6799, 215.0227, 220.1313]
NTUb = UA_correct./C_min
 
figure(1)
plot(NTU, eff1)
hold on
plot(NTU, eff2)
plot(NTU, eff3)
plot(NTU, eff4)
plot(NTU, eff5)
scatter(NTUb, eff_correct, 'b*')
title('Concentric Counterflow')
xlabel('NTU')
ylabel('Effectiveness')
legend('C_r = 0.3643', 'C_r = 0.7287', 'C_r = 0.9149', 'C_r = 0.6862', 'C_r = 0.5489', 'location', 'southeast')
hold off