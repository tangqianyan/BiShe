clear;
shot=042999;
t=[6.14 6.165];
nstep=8;
T0=linspace(t(1),t(2),nstep); %生成8个时间点
CH=24;
ROW=16;
% 测量区域
CHH=linspace(CH,1,CH);
RWW=linspace(ROW,1,ROW);
[RWW,CHH]=meshgrid(RWW,CHH);
%取剖面的时刻点；
if  shot<44000
    DIR='F:\ProgramProject\ECEI-loaddata\';
elseif  shot<60000
    DIR='F:\ProgramProject\ECEI-loaddata\';
else
    DIR='F:\ProgramProject\ECEI-loaddata\';
end
%判断路径是否存在;
path=[pwd,'\data\',num2str(shot)];
if ~isdir(path)
    mkdir(path);
end
[data0,T_sigal]=loadeceieast1(shot,12, 8, t,1e6,1,DIR);
for i=1:nstep
    [temp,N(i)]=min(abs(T_sigal-T0(i)));
end
T=T_sigal(N);
for i=1:CH
    for j=1:ROW
        % data（ECEI电压信号，正比于等离子体电子温度）;
        [data0,T_sigal]=loadeceieast1(shot, i, j, t,1e6,1);
        %         data1=smooth(data0,500);
        data1=mean(data0);
        data2=(data0-data1)./data1;%温度扰动；
        data(i,j,:)=data2(N);
    end
end

for i = 1:nstep
    A = data(:,:,i);
    str1 = strcat('.\data\42987',num2str(i),'.txt');
    dlmwrite(str1,A ,'precision','%.4f', 'delimiter',',')
    
end
clear T_sigal data0 data1 data2;
str = strcat(num2str(shot),'ECEI_',' [',num2str(t(1)),'-',num2str(t(2)),']');
% load(['F:\ProgramProject\ECEI-loaddata\colorstyle.txt']);
figure;
title(str);
set(gca,'nextplot','replacechildren');
for i = 1:nstep
    % for i = 16
    %     contourf(RWW,CHH,data(:,:,i));
    pcolor(RWW,CHH,data(:,:,i));
    axis tight;
    axis equal;
    colorbar;
%     colormap(colorstyle);
    set(gca,'CLim',[-0.2,0.3]);
    %     pause(0.5);
    %     legend( num2str(T(i)));
    h_axes=findobj(gcf,'type','axes');
    set(h_axes,'LineWidth',1.5);
    set(h_axes,'fontsize',14)
    set(h_axes,'fontweight','bold')
    set(h_axes,'XMinorTick','on')
    set(h_axes,'YMinorTick','on')
    set(h_axes,'layer','top')
    
    saveas(gcf, [path,'\',str,num2str(i),'.png']);
    m(i) = getframe(gca);
end
% movie(m,n,fps)，将矩阵m中的动画帧以每秒fps帧的速度播放n次

%生成movie；
myObj = VideoWriter([path,'\newfile.avi'],'Uncompressed AVI' );%初始化一个avi文件
myObj.FrameRate = 2;
open(myObj);
for i=1:nstep
    frame=imread([path,'\',str,num2str(i),'.png']);
    writeVideo(myObj,frame);
end
close(myObj);


