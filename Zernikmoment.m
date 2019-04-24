function [Z, Rad] = Zernikmoment(p,n,m)
%����Zernike��
%Z:Zernike��
%Rad:�������ʽ
%p:NxN�Ķ�ֵͼ��
%n:Zernike����
%m:Zernike�ظ���
N = size(p,1);
x = 1:N; y = x;
[X,Y] = meshgrid(x,y);
R = sqrt((2.*X-N-1).^2+(2.*Y-N-1).^2)/N;
R = R./sqrt(2);

Theta = atan2((N-1-2.*Y+2),(2.*X-N+1-2));
R = (R<=1).*R;
Rad = Radialpoly(R,n,m);    %�������ʽ
Product = p(x,y).*Rad.*exp(-1i*m*Theta);
Z = sum(Product(:));        
cnt = nnz(R)+1;%��һ������
Z = (n+1)*Z/cnt;

