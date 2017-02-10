function [number,stats,thres,rects,Bund]=judgeCircle(newMatrix,minAera,thresThreshold,fig_i)
%-----------------------------SET DEFAULT----------------------------------
if ~exist('minAera','var'),
    minAera=6;
end
if ~exist('thresThreshold','var'),
    thresThreshold = 0.04;
end

%--------------------------------------------------------------

newMatrix = fliplr(newMatrix);
newMatrix = flipud(newMatrix);
% 
% nmax = max(max(newMatrix));
% nmin = min(min(newMatrix));
% 
% newMatrix = (newMatrix-nmin)/ (nmax-nmin);
% figure,
% imshow(newMatrix);

% [A_hat E_hat iter] = exact_alm_rpca(newMatrix,0.2);
% figure,
% imshow(A_hat);
% newMatrix = A_hat;
%--------------------
CH=24;
ROW=16;
for i=1:CH-1
    for j=1:ROW-1
        A(i,j) = (newMatrix(i,j)-newMatrix(i+1,j))^2 +(newMatrix(i,j)-newMatrix(i+1,j+1))^2+(newMatrix(i,j)-newMatrix(i,j+1))^2;
    end
end
% newMatrix = A;
%--------------------


%------------------------¿Õ¼äÂË²¨-----------------
I = newMatrix;
w1=fspecial('average',[3 3]);
w2=fspecial('sobel');
w3=fspecial('gaussian',[3 3],0.5);
w4=fspecial('laplacian',0.2);
w5=fspecial('log',[5 5],0.5);
g1=imfilter(I,w1,'replicate');
g2=imfilter(I,w2,'replicate');
g3=imfilter(I,w3,'replicate');
g4=imfilter(I,w4,'replicate');
g5=imfilter(I,w5,'replicate');
g6=medfilt2(I);
%-------------------------------------------------
newMatrix = g6;
%-----------------------------------------------

thres = graythresh(newMatrix);
BW =im2bw(newMatrix,thres);
BW = bwareaopen(BW,minAera);
se = strel('disk',3);
BW = imclose(BW,se);
BW1 = imclearborder(BW,1);
BW2 = imfill(BW1,'holes');
%-------------------------Judge Threshold--------------------------------
if thres < thresThreshold
    BW2 = 1-BW2;
end

[Bund,L] = bwboundaries(BW,'noholes');
img_reg=regionprops(BW2,'area','boundingbox');
% areas=[img_reg.Area];
rects=cat(1,img_reg.BoundingBox);
number = size(rects,1);
stats=regionprops(BW2,'Area','Centroid');%
% for i = 1:size(rects, 1)
%     rectangle('position', rects(i, :), 'EdgeColor', 'r');
% end
% str = strcat('F:\ProgramProject\ECEI-loaddata\dataTag\42999\',num2str(fig_i),'b.png')

