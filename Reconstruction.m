function [T,F]=Reconstruction(I,p)
%����Zernike���ؽ�ͼ��
%F:�ؽ����
%I:�����ֵͼ��
%m:Zernike�صĽ���
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

%%%%%     CPU     %%%%%
% for n=0:p
%    for m=-n:2:n
%    %for m = n:-2:0
%     [Znm,Rad]=Zernikmoment(I,n,m);
%     Exp=exp(1i*m*Theta);
%     F=F+Znm.*Rad.*Exp;
%     %F=F+Znm.*Rad.*Exp;
%     end
% end

%%%%%     CPU     %%%%%
global Zjun1;
global Zjun2;
Zjun1 = zeros(50);
Zjun2 = zeros(50);
for n=0:p
    for m=-n:2:n
        if (m<0)
            k = -m;
            [Znm,Rad]=Zernikmoment(I,n,m);
            Exp=exp(1i*m*Theta);
            Zjun2(n+1,k+1) = Znm;
            F=F+Z2(n+1,k+1).*Rad.*Exp;
            T=T+Znm.*Rad.*Exp;
        else
            [Znm,Rad]=Zernikmoment(I,n,m);
            Exp=exp(1i*m*Theta);
            Zjun1(n+1,m+1) = Znm;
            F=F+Z1(n+1,m+1).*Rad.*Exp;
            T=T+Znm.*Rad.*Exp;
        end
        %F=F+Znm.*Rad.*Exp;
    end
end

F=real(F);
