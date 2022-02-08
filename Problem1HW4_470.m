q_dot=1000;
k=5;
L=0.3;
T_s=473.15;
x=0:0.01:0.3;
T=-(q_dot*x.^2)/(2*k)+(q_dot*L/k)*x+T_s;
Ans=max(T) %482.1500 K

plot(x,T)
xlabel('Length (m)');
ylabel('Temperature (K)');
title('Temperature Change Over Plane Wall');
