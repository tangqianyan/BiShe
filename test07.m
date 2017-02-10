data = loadeceieast1(042987,6,6,[3 4],1e6,0,DIR);
plot(data);
Fs=1000000;%����Ƶ��
fc=10000;%��ֹƵ��
WC=2*pi*fc;%��ֹ��Ƶ��
N=6;%����
[b,a]=butter(N,WC,'s');
[bz,az]=impinvar(b,a,Fs);%�弤��Ӧ���䷨
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