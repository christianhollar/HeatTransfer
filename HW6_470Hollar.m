clear all; close all; clc;

m = 6;
n = 4;
A=zeros(m*n,m*n);
C=zeros(m*n,1);

h_air = 200;
h_gas=900;
K=15;

D_x=0.01;
D_y=0.01;

T_uniform = 250+273.15;
T_inf_1=100+273.15;
T_inf_0=1400+273.15;

case0=[1,4,5,8,9,12,13,16,17,20,21,24];
case1=[6,7,18,19];
case2=[10,11,14,15];
case3=[2,3,22,23];

for k = 1:m*n
    if(ismember(k,case0))
        A(k,k)=1;
        C(k,1)=T_uniform;
    end
    if(ismember(k,case1))
        A(k,k)=-4;
        A(k,k-1)=1;
        A(k,k+1)=1;
        A(k,k-4)=1;
        A(k,k+4)=1;
        C(k,1)=0;
    end
    if(ismember(k,case2))
        A(k,k)=-2*(3+h_air*D_x/K);
        C(k,1)=2*T_inf_1*h_air/K;
        if(k==10)
            A(k,k-1)=2;
            A(k,k+1)=1;
            A(k,k-4)=2;
            A(k,k+4)=1;
        end
        if(k==11)
            A(k,k-1)=1;
            A(k,k+1)=2;
            A(k,k-4)=2;
            A(k,k+4)=1;
        end
        if(k==14)
            A(k,k-1)=2;
            A(k,k+1)=1;
            A(k,k-4)=1;
            A(k,k+4)=2;
        end
        if(k==15)
            A(k,k-1)=1;
            A(k,k+1)=2;
            A(k,k-4)=1;
            A(k,k+4)=2;
        end
        
    end
    
    if(ismember(k,case3))
        A(k,k)=-2*(2+h_air*D_x/K);
        A(k,k-1)=1;
        A(k,k+1)=1;
        C(k,1)=2*h_gas*D_x*T_inf_0/K;
        if((k==2)||(k==3))
            A(k,k+4)=2;
        end
        if((k==22)||(k==23))
            A(k,k-4)=2;
        end
    end
   
end

T=A\C;

% T =
% 
%    1.0e+03 *
% 
%     0.5232
%    -1.0984
%    -1.0984
%     0.5232
%     0.5232
%    -1.0517
%    -1.0517
%     0.5232
%     0.5232
%    -2.5800
%    -2.5800
%     0.5232
%     0.5232
%    -2.5800
%    -2.5800
%     0.5232
%     0.5232
%    -1.0517
%    -1.0517
%     0.5232
%     0.5232
%    -1.0984
%    -1.0984
%     0.5232
    
W = 0.01;

for i=1:m
    x(i,1)=(i-1)*W/(m-1); % x - Mx1 vector of x-positions of each node (m)
end
for j=1:n
    y(j,1)=(j-1)*W/(n-1); % y - Nx1 vector of y-positions of each node (m)
end

for i=1:m
    for j=1:n
        T_grid(i,j)=T(m*(j-1)+i);
    end
end

mesh(x,y,T_grid'); colormap jet; colorbar;