clc
clear all 
close all
 
mDotC = [4,5,1,2,3]*0.63; 
mDotH = [2.75,2.75,2.75,2.75,2.75]*0.63;
 
T_hi = [54.5,55.0,54.8,55.3,55.6];
T_co = [19.7,18.7,29.4,25,22.2];
T_ci = [12.4,12.5,12.9,12.9,12.9];
T_ho = [45.1,44.7,48.8,46.9,46.5];
 
T_ave_c = (T_co+T_ci)/2+273;
T_ave_h = (T_hi+T_ho)/2+273;

c_c = [4184,4184,4181,4184,4184];
c_h = [4182,4182,4182,4182,4182];

C_c = zeros(1,length(mDotC));
C_h = zeros(1,length(mDotC));
C_r = zeros(1,length(mDotC));
C_min = zeros(1,length(mDotC));

for k = 1:length(mDotC) 
    C_c(k) = c_c(k)*mDotC(k);
    C_h(k) = c_h(k)*mDotH(k);
    C_min(k) = min(C_c(k),C_h(k));
    C_r(k) = min(C_c(k),C_h(k))/max(C_c(k),C_h(k));
end

NTU = 0:0.25:5;
 
eff = zeros(length(mDotC),length(NTU));

for k = 1:length(C_r)
    for j = 1:length(NTU)
        effCC(k,j) = (1-exp(-NTU(j)*(1-C_r(k))))./(1-C_r(k)*exp(-NTU(j)*(1-C_r(k))));
        eff(k,j) = 2*(1+C_r(k)+(1+C_r(k)^2)*(1+exp(-NTU(j)*(1+C_r(k)^2)^0.5))/(1-exp(-NTU(j)*(1+C_r(k)^2)^0.5)))^-1;
    end
end



delta_T1 = T_hi - T_co;
delta_T2 = T_ho - T_ci;

delta_Tm = (delta_T2-delta_T1)./log(delta_T2./delta_T1)

c_c
mDotC
qc = (mDotC.*c_c).*(T_co-T_ci);
qh = (mDotH.*c_h).*(T_hi-T_ho);
C_min
qmax = C_min.*(T_hi-T_ci); 

effh = qh./qmax
effc = qc./qmax

for k = 1:length(delta_Tm)  
    effPoints(k) = min(effc(k),effh(k));
end

UA_c = qc./delta_Tm;
UA_h = qh./delta_Tm;

for k = 1:length(delta_Tm)  
    UA(k) = min(UA_c(k),UA_h(k));
end

NTUPoints = UA./C_min;

plot(NTU, eff(1,:),'r')
hold on
plot(NTU, eff(2,:),'g')
plot(NTU, eff(3,:),'b')
plot(NTU, eff(4,:),'c')
plot(NTU, eff(5,:),'m')

scatter(NTUPoints, effPoints, 'b*')

plot(NTU, effCC(1,:),'ro')
plot(NTU, effCC(2,:),'go')
plot(NTU, effCC(3,:),'bo')
plot(NTU, effCC(4,:),'co')
plot(NTU, effCC(5,:),'mo')
title('Effectiveness-NTU for One Pass Shell-and-Tube and Concentric Tube Counterflow Heat Exchangers');
xlabel('NTU');
ylabel('\epsilon');
legend('0.3635 ','0.5497','0.6872 ','0.7276','0.9162','Concentric Counterflow Data Points');
