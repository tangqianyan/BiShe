% function [R] = picFilter(A)
% fs=3000;Wp=2*pi*1.5/fs;Ws=2*pi*4/fs;Rp=0.7;Rs=1.3;
% Omip=Wp/pi;Omis=Ws/pi;%��һ������Ҫ��
% [N,Wn]=buttord(Omip,Omis,Rp,Rs);%ȷ���˲����Ľ���
% % disp(['The order of Butterworth Filtering is',num2str(N)]);
% [b,a]=butter(N,Wn);%ȷ��Butterworth�˲���ת�ƺ���ϵ������
% R=filter(b,a,A);
% 
% A=double(A);
% r=rank(A);
% [s v d]=svd(A);
% R=s(:,:)*v(:,1:10)*d(:,1:10)';