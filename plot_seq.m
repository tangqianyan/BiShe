% figure to seq
% n: para of function PAA
%
% jcl 2016/5/13

n = 10000;
PAA_seq = PAA(data,n);
t_new = linspace(t(1),t(end),length(t)/n);
figure,plot(t_new,PAA_seq)
