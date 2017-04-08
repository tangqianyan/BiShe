% function [R] = picFilter(A)
% fs=3000;Wp=2*pi*1.5/fs;Ws=2*pi*4/fs;Rp=0.7;Rs=1.3;
% Omip=Wp/pi;Omis=Ws/pi;%归一化技术要求
% [N,Wn]=buttord(Omip,Omis,Rp,Rs);%确定滤波器的阶数
% % disp(['The order of Butterworth Filtering is',num2str(N)]);
% [b,a]=butter(N,Wn);%确定Butterworth滤波器转移函数系数向量
% R=filter(b,a,A);
% 
% A=double(A);
% r=rank(A);
% [s v d]=svd(A);
% R=s(:,:)*v(:,1:10)*d(:,1:10)';