function [number,stats,thres,rects,Bund,interpMatrix]=judgeCircle(newMatrix,minAera,thresThreshold,fig_i)
%-----------------------------SET DEFAULT----------------------------------
if ~exist('minAera','var'),
    minAera=500;
end
if ~exist('thresThreshold','var'),
    thresThreshold = 0.1;
end

%--------------------------------------------------------------

newMatrix = fliplr(newMatrix);
newMatrix = flipud(newMatrix);
% 
nmax = max(max(newMatrix));
nmin = min(min(newMatrix));

newMatrix = (newMatrix-nmin)/ (nmax-nmin);

ZI = interp2(newMatrix,2,'spline')
interpMatrix = ZI;
interpMatrix = fliplr(interpMatrix);
interpMatrix = flipud(interpMatrix);
% [A_hat E_hat iter] = exact_alm_rpca(newMatrix,0.2);
% figure,
% imshow(A_hat);
% newMatrix = A_hat;
%--------------------
% CH=24;
% ROW=16;
% for i=1:CH-1
%     for j=1:ROW-1
%         A(i,j) = (newMatrix(i,j)-newMatrix(i+1,j))^2 +(newMatrix(i,j)-newMatrix(i+1,j+1))^2+(newMatrix(i,j)-newMatrix(i,j+1))^2;
%     end
% end
% newMatrix = A;
%--------------------

newMatrix = ZI;
%------------------------空间滤波-----------------
I = newMatrix;
w1=fspecial('average',[5 5]);
g1=imfilter(I,w1,'replicate');
g6=medfilt2(I);
%-------------------------------------------------
% g1=imfilter(g1,w1,'replicate');

P=[0 1 0
   1 1 1
   0 1 0];

A1 = g1;
A2=imdilate(A1,P);%图像A1被结构元素B膨胀
A3=imdilate(A2,P);
A4=imdilate(A3,P);
figure,
subplot(221),imshow(A1);
subplot(222),imshow(A2);
subplot(223),imshow(A3);
subplot(224),imshow(A4);

%--------------------------
newMatrix = A1;
thres = graythresh(newMatrix);
BW =im2bw(newMatrix,thres);

%------------
figure,
subplot(221),imshow(BW);
%--------------
BW = bwareaopen(BW,minAera,4);
subplot(222),imshow(BW);

se = strel('disk',3);
BW = imclose(BW,se);
subplot(223),imshow(BW);
%----------

BW2 = imfill(BW,'holes');
subplot(224),imshow(BW2);

%-------------------------Judge Threshold--------------------------------
% if thres < thresThreshold
%     BW2 = 1-BW2;
% end


[Bund,L] = bwboundaries(BW2,'noholes');
img_reg=regionprops(BW2,'area','boundingbox');
% areas=[img_reg.Area];
rects=cat(1,img_reg.BoundingBox);
number = size(rects,1);
stats=regionprops(BW2,'Area','Centroid');%
% for i = 1:size(rects, 1)
%     rectangle('position', rects(i, :), 'EdgeColor', 'r');
% end
% str = strcat('F:\ProgramProject\ECEI-loaddata\dataTag\42999\',num2str(fig_i),'b.png')

