clc; clear all; close all;
set(gcf,'color','white')
%I = imread('mouse.jpg');

I = imread('jun_pic.tif');
I = im2double(I);

%I  = I ./4;
%I = imresize(I,[128,128]);
%I=logical(I);
%  F=jun(I,140);
F=Reconstruction(I,8);

F= F./(max(max(F)));
imwrite(F,'recon_tiffany.tif');
figure(1)
imshow(F,[]);


%nmse = calNMSE(I , F,0);
NMSE = jun_NMSE(I ,F);
