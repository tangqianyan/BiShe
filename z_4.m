
for i=14:14
%     j=var(i,51);
%     [data1,~]=loadeceieast1(a(K(i,2)-3),K(i,3),K(i,4),[(j-1)*0.2 (j-1)*0.2+0.02],1e6,1,'F:\ProgramProject\ECEI-loaddata\');
   [data,~]=loadeceieast1(42288,13,9,[3.4 3.6],1e6,1,'F:\ProgramProject\ECEI-loaddata\');
   figure(1)
   plot(data);
   grid on
   p=mean(data);
   err=(data-p)/p;
   fs=1000000;
   t=0:1/fs:0.2-1/fs;
   wp=2*100/fs;
   ws=2*10000/fs;
   Rp=1;
   As=30;
  [N,wc]=buttord(wp,ws,Rp,As);
[B,A]=butter(N,wc);
[H,W]=freqz(B,A);
y=filter(B,A,err);
figure(2)
plot(W,abs(H));
title('µÍÍ¨ÂË²¨Æ÷');
grid on
figure(3)
plot(t,y)
title('30Hz');

  

  

  
   err=max(abs(y));
   
  
 end

