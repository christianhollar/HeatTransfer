clear all; close all; clc;
T=([178,161.1,143.7,130.2,118.4,108.5,98.8,91.2,84.2,71.1,71.4]-32)*5/9+273.15;
T_steel=([192.8,181.4,168.7,0,0,0,82.4,79.7,76.8]-32)*5/9+273.15;

for i=4:6
    T_inc = (T_steel(7)-T_steel(3))/4;
    T_steel(i)=T_steel(i-1)+T_inc;
end

X=zeros(size(T));

for i=2:11
    X(i)=X(i-1)+25.4;
end

X=X(1:9);
T=T(1:9);

plot(X,T,'bo')
ylabel(['Temperature (' char(176) 'F)']);
xlabel('\Delta X(mm)');
fitA = polyfit(X,T,1)
fitA(1)

X_fit=1:1:X(length(X));
Y_fit=X_fit.*fitA(1)+fitA(2);

hold on
plot(X_fit,Y_fit)
title('Linear Fit for ^{\Delta T}/_{\Delta X}');

fitA = polyfit([X(3) X(7)], [T_steel(3) T_steel(7)], 1)
T_steel(7)-T_steel(3)
X(7)-X(3)
X_fit=1:1:X(length(X));
Y_fit=X_fit.*fitA(1)+fitA(2);

for i=1:3
    T_steel(4)
    T_steel(4)=[];
    X(4)=[];
end

plot(X,T_steel,'ro')
plot(X_fit,Y_fit)
legend('Experimental Brass','Model Brass','Experimental Steel','Model Steel');