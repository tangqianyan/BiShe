function [R] = bandpassFilter(X)
% 
% %��ͨ�˲�
% %ʹ��ע�����ͨ��������Ľ�ֹƵ�ʵ�ѡȡ��Χ�ǲ��ܳ��������ʵ�һ��
% %����f1,f3��ֵ��ҪС�� Fs/2
% %x:��Ҫ��ͨ�˲�������
% % f 1��ͨ����ֹƵ��
% % f 3�������ֹƵ��
% %rp���ߴ���˥��DB������
% %rs����ֹ��˥��DB������
% %FS������x�Ĳ���Ƶ��
% % rp=0.1;rs=30;%ͨ����˥��DBֵ�������˥��DBֵ
% % Fs=2000;%������
% %
% f1 = 1;
% f3 = 10;
% rp = 0.1;
% rs = 20;
% Fs = 1000000;
% wp=2*pi*f1/Fs;
% ws=2*pi*f3/Fs;
% % ����б�ѩ���˲�����
% [n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
% [bz1,az1]=cheby1(n,rp,wp/pi);
% %�鿴����˲���������
% % [h,w]=freqz(bz1,az1,256,Fs);
% % h=20*log10(abs(h));
% % figure;plot(w,h);title('������˲�����ͨ������');grid on;
% % %
% R=filter(bz1,az1,A);%������x�˲���õ�������y
% end
fp = [10 30];
fs = [1 10000];
ap = 2 ;
as = 30;
fsa = 1000000;
wp = fp/fsa*2;
ws = fs/fsa*2;
[n,wn] = buttord(wp,ws,ap,as);
[B,A] = butter(n,wn);
[H,w] = freqz(B,A,512);
R = filter(B,A,X);
end