% Fs = 128; % 采样频率
% T = 1/Fs; % 采样时间
% L = 256; % 信号长度
% t = (0:L-1)*T;% 时间
% x = 5 + 7*cos(2*pi*15*t - 30*pi/180) + 3*cos(2*pi*40*t - 90*pi/180);%cos为底原始信号
% y = x + randn(size(t)); %添加噪声
% figure;
% plot(t,y)
% title('加噪声的信号')
% xlabel('时间(s)')
% 
% N = 2^nextpow2(L);%采样点数，采样点数越大，分辨的频率越精确，N>=L，超出的部分信号补为0
% Y = fft(y,N)/N*2; %除以N乘以2才是真实幅值，N越大，幅值精度越高
% f = Fs/N*(0:1:N-1); %频率
% A = abs(Y); %幅值
% P = angle(Y); %相值
% figure;
% subplot(211);plot(f(1:N/2),A(1:N/2)); %函数fft返回值的数据结构具有对称性,因此我们只取前一半
% title('幅值频谱')
% xlabel('频率(Hz)')
% ylabel('幅值')
% subplot(212);plot(f(1:N/2),P(1:N/2));
% title('相位谱频')
% xlabel('频率(Hz)')
% ylabel('相位')

t=[0:0.002:5.998]';%时间轴 
d =0:1/1.8:6;% 尖峰信号 
nNoiseECG=sin(2*pi*0.24*t)+2*pulstran(t,d,'tripuls',0.1,1)+0.1*randn(3000,1);% 叠加正弦漂移和尖峰信号以及随机白噪声 
plot(t,nNoiseECG) 
xlabel('t(s)') 
ylabel('Voltage(v)') 
title('Original Signal') 

Y = fft(nNoiseECG,16384);%进行16384个点的fft变换
Pyy = Y.* conj(Y) /16384;%功率谱转换
f = 500*(0:8192)/16384;
plot(f,Pyy(1:8193))
title('Frequency content of y')
xlabel('frequency (Hz)')
axis([0 10 0 1500]);
grid on;

