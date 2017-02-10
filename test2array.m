B=load('.\data\429871.txt');
B = fliplr(B);
B = flipud(B);
nmax = max(max(B));
nmin = min(min(B));

B = (B-nmin)/ (nmax-nmin);
figure,
imshow(B);
%--------------------

% [A_hat E_hat iter] = exact_alm_rpca(B,0.2);
% figure,
% imshow(A_hat );
CH = 24;
ROW=16;
for i=1:CH-1
    for j=1:ROW-1
        A(i,j) = (B(i,j)-B(i+1,j))^2 +(B(i,j)-B(i+1,j+1))^2+(B(i,j)-B(i,j+1))^2;
    end
end
%--------------------
% B = A;
% 
% B = A_hat;
thres = graythresh(B);
C =im2bw(B,thres);
BW = bwareaopen(C,6);
se = strel('disk',3);
BW = imclose(C,se);
BW1 = imclearborder(BW,1);
BW2 = imfill(BW1,'holes');
if thres < 0.02
    BW2 = 1-BW2;
end
img_reg=regionprops(BW2,'area','boundingbox');
[B,L] = bwboundaries(BW,'noholes');

% img_bound =regionprops(BW2,'Perimeter','PixelIdxList');
areas=[img_reg.Area];
rects=cat(1,img_reg.BoundingBox);
% show all the largest connected region
figure,
imshow(BW2);
for i = 1:size(rects, 1)
    rectangle('position', rects(i, :), 'EdgeColor', 'r','LineWidth', 2);
    stats=regionprops(BW2,'Area','Centroid');%
end
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end