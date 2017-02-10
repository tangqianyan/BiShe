%空间域滤波
clc;close all;
I=load('.\data\429871.txt');
I = fliplr(I);
I = flipud(I);
nmax = max(max(I));
nmin = min(min(I));

I = (I-nmin)/ (nmax-nmin);
figure,
imshow(I);

w1=fspecial('average',[3 3]);
w2=fspecial('sobel');
w3=fspecial('gaussian',[3 3],0.5);
w4=fspecial('laplacian',0.2);
w5=fspecial('log',[5 5],0.5);
g1=imfilter(I,w1,'replicate');
g2=imfilter(I,w2,'replicate');
g3=imfilter(I,w3,'replicate');
g4=imfilter(I,w4,'replicate');
g5=imfilter(I,w5,'replicate');
g6=medfilt2(I);
subplot(3,3,1);imshow(I);title('原图');
subplot(3,3,2);imshow(g1);title('均值滤波');
subplot(3,3,3);imshow(g2);title('索贝尔滤波');
subplot(3,3,4);imshow(g3);title('高斯滤波');
subplot(3,3,5);imshow(g4);title('拉普拉斯滤波');
subplot(3,3,6);imshow(g5);title('高斯-拉普拉斯滤波');
subplot(3,3,7);imshow(g6);title('中值滤波');