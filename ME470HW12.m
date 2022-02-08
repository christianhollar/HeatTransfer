clear all; close all; clc;

Vel = [2,4,6,1.5,7.8,10,15,20];

v = 18.07*10^(-6); %m^2/s
W = 1.2;
D = 0.3;
A = W*D;
Pr = 0.701;
K = 28.15*10^-3;
sigma = 5.67*10^-8;
epsilon = 1;
qs = 600;
q = qs*A;

for k = 1:length(Vel)
    
    Re = Vel(k)*W/v;
    
    if(Re<5*10^5)        
        Nu_bar = 0.664*Re^(1/2)*Pr^(1/3);
    else
        Nu_bar = 0.037*Re^(4/5)*Pr^(1/3);
    end

    h_bar = Nu_bar*K/W;

    Rconv = 1/(h_bar*W*D);

    A = W*D;

    Tsur = 305;
    syms Ts
    Rrad = 1/(A*sigma*epsilon*(Ts^2+Tsur^2)*(Ts+Tsur));
    n = 0.2 - (Ts-298)*0.0025;
    Rtot=(1/Rrad+1/Rconv)^-1;
    eqn = Ts - Tsur == Rtot*q*(1-n);

    Ts = vpa(solve(eqn,Ts));
    Ts = Ts(1);
    
    if(k==1)
        Ts(1) % 347.79
    end
    
    n = 0.2 - (Ts(1)-298)*0.0025;
    W_elec(k) = n*qs*W*D;
end

plot(Vel,W_elec)
xlabel('Velocity (m/s)');
ylabel('W_electrical (W)');