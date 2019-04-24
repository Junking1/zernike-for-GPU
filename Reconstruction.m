function [T,F]=Reconstruction(I,p)
%利用Zernike矩重建图像
%F:重建结果
%I:输入二值图像
%m:Zernike矩的阶数
load('Z1.mat');
load('Z2.mat');
Z1 = Z1';
Z2 = Z2';
N=size(I,1);
F=zeros(size(I));
T=zeros(size(I));
x = 1:N;
y = x;
[X,Y] = meshgrid(x,y);
Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));



%%%%%     PU     %%%%%

for n=0:p
    for m=-n:2:n
        if (m<0)
            k = -m;
            [Znm,Rad]=Zernikmoment(I,n,m);
            Exp=exp(1i*m*Theta);
   
            F=F+Z2(n+1,k+1).*Rad.*Exp;
        else
            [Znm,Rad]=Zernikmoment(I,n,m);
            Exp=exp(1i*m*Theta);
 
            F=F+Z1(n+1,m+1).*Rad.*Exp;

        end
        %F=F+Znm.*Rad.*Exp;
    end
end

F=real(F);
