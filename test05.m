% Fs = 128; % ����Ƶ��
% T = 1/Fs; % ����ʱ��
% L = 256; % �źų���
% t = (0:L-1)*T;% ʱ��
% x = 5 + 7*cos(2*pi*15*t - 30*pi/180) + 3*cos(2*pi*40*t - 90*pi/180);%cosΪ��ԭʼ�ź�
% y = x + randn(size(t)); %�������
% figure;
% plot(t,y)
% title('���������ź�')
% xlabel('ʱ��(s)')
% 
% N = 2^nextpow2(L);%������������������Խ�󣬷ֱ��Ƶ��Խ��ȷ��N>=L�������Ĳ����źŲ�Ϊ0
% Y = fft(y,N)/N*2; %����N����2������ʵ��ֵ��NԽ�󣬷�ֵ����Խ��
% f = Fs/N*(0:1:N-1); %Ƶ��
% A = abs(Y); %��ֵ
% P = angle(Y); %��ֵ
% figure;
% subplot(211);plot(f(1:N/2),A(1:N/2)); %����fft����ֵ�����ݽṹ���жԳ���,�������ֻȡǰһ��
% title('��ֵƵ��')
% xlabel('Ƶ��(Hz)')
% ylabel('��ֵ')
% subplot(212);plot(f(1:N/2),P(1:N/2));
% title('��λ��Ƶ')
% xlabel('Ƶ��(Hz)')
% ylabel('��λ')

t=[0:0.002:5.998]';%ʱ���� 
d =0:1/1.8:6;% ����ź� 
nNoiseECG=sin(2*pi*0.24*t)+2*pulstran(t,d,'tripuls',0.1,1)+0.1*randn(3000,1);% ��������Ư�ƺͼ���ź��Լ���������� 
plot(t,nNoiseECG) 
xlabel('t(s)') 
ylabel('Voltage(v)') 
title('Original Signal') 

Y = fft(nNoiseECG,16384);%����16384�����fft�任
Pyy = Y.* conj(Y) /16384;%������ת��
f = 500*(0:8192)/16384;
plot(f,Pyy(1:8193))
title('Frequency content of y')
xlabel('frequency (Hz)')
axis([0 10 0 1500]);
grid on;

