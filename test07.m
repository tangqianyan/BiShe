data = loadeceieast1(042987,6,6,[3 4],1e6,0,DIR);
plot(data);
Fs=1000000;%采样频率
fc=10000;%截止频率
WC=2*pi*fc;%截止角频率
N=6;%阶数
[b,a]=butter(N,WC,'s');
[bz,az]=impinvar(b,a,Fs);%冲激响应不变法
k = 1:255;
x=data;
y=filter(bz,az,x);
subplot(2,1,1);
plot(x);
xlabel('Time index n'); ylabel('Amplitude');
title('Input sequence');
subplot(2,1,2);
plot(y);
xlabel('Time index n'); ylabel('Amplitude');
title('Output sequence');