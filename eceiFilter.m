
function [newData] = eceiFilter(data,dur)
   fs=1000000;
   t=0:1/fs:dur-1/fs;
   wp=2*30/fs;
   ws=2*10000/fs;
   Rp=1;
   As=30;
    [N,wc]=buttord(wp,ws,Rp,As);
    [B,A]=butter(N,wc);
    [H,W]=freqz(B,A);
    newData=filter(B,A,data);
end

