clear all; close all; clc;
%d/e
u = 0.22;
k = 0.14;
V = 10;
L = 0.005;
C2 = 20+273.15;
C1 = (40+u/k*V^2/2)/L;
y = 0:0.00001:0.005;
T = -u/k*(V/L)^2.*y.^2/2+C1*y+C2;

T(length(T))-273.15
T(1)-273.15
plot(y,T-273.15)

[max_value,index]=max(T)
y(index)
% Max Temperature 65 C
% @ y = 0.0038 m
