B=load('429871.txt');
B = fliplr(B);
B = flipud(B);
nmax = max(max(B));
nmin = min(min(B));

B = (B-nmin)/ (nmax-nmin);
figure,
imshow(B);
I = B;
ff=imidealflpf(I,20);%�����˾�
out=imfreqfilt(I,ff);%Ӧ���˾�
figure(1);
subplot(2,2,1);
imshow(I);
title('source');
%����FFT����ʾ
temp=fft2(double(I));
temp=fftshift(temp);
temp=log(1+abs(temp));
figure(2);
subplot(2,2,1);
imshow(temp,[]);
title('source1');
figure(1);
subplot(2,2,2);
imshow(out);
title('Ideal LPF ,freq=20');
%����FFT����ʾ
temp=fft2(out);
temp=fftshift(temp);
temp=log(1+abs(temp));
figure(2);
subplot(2,2,2);
imshow(temp,[]);
title('Ideal LPF ,freq=20');

ff=imidealflpf(I,40);%�����˾�
out=imfreqfilt(I,ff);%Ӧ���˾�
figure(1);
subplot(2,2,3);
imshow(out);
title('Tdeal LPF,freq=40');
%����FFT����ʾ
temp=fft2(out);
temp=fftshift(temp);
temp=log(1+abs(temp));
figure(2);
subplot(2,2,3);
imshow(temp,[]);
title('Ideal LPF ,freq=40');

ff=imidealflpf(I,60);%�����˾�
out=imfreqfilt(I,ff);%Ӧ���˾�
figure(1);
subplot(2,2,4);
imshow(out);
title('Tdeal LPF,freq=60');
%����FFT����ʾ
temp=fft2(out);
temp=fftshift(temp);
temp=log(1+abs(temp));
figure(2);
subplot(2,2,4);
imshow(temp,[]);
title('Ideal LPF ,freq=60');
