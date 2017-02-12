function drawTag(shot,matrix,t,rects,fig_i,B)
%-----------------------------SET DEFAULT----------------------------------
if isempty(rects)
    path=[pwd,'\dataTag\',num2str(shot),'_uninst'];
else
    path=[pwd,'\dataTag\',num2str(shot),'_inst'];

end
%-------------Draw Fingure-------------
CH=93;
ROW=61;
% 测量区域
CHH=linspace(CH,1,CH);
RWW=linspace(ROW,1,ROW);
[RWW,CHH]=meshgrid(RWW,CHH);

%判断路径是否存在;

if ~isdir(path)
    mkdir(path);
end
str = strcat(num2str(shot),'ECEI_',' [',num2str(t(1)),'-',num2str(t(2)),']');
figure;
title(str);
set(gca,'nextplot','replacechildren');
set(gca,'XGrid','off');
    pcolor(RWW,CHH,matrix);
    axis tight;
    axis equal;
    colorbar;
    set(gca,'CLim',[0,1]);
    h_axes=findobj(gcf,'type','axes');
    set(h_axes,'LineWidth',1.5);
    set(h_axes,'fontsize',14)
    set(h_axes,'fontweight','bold')
    set(h_axes,'XMinorTick','on')
    set(h_axes,'YMinorTick','on')
    set(h_axes,'layer','top')
    axis off;
   
    
% % BW = imread([path,'\',str,num2str(fig_i),'.png']);
% % figure(1),
% % imshow(BW);
% for i = 1:size(rects, 1)
%     rectangle('position', rects(i, :), 'EdgeColor', 'r','LineWidth',3);
% end
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
 saveas(gcf, [path,'\',str,num2str(fig_i),'.png']);