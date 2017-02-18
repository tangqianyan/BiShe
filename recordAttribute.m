function recordAttribute(filename,circleNum,stats,time)
% circleNum=0;
% stats(1).Aera = [1 2];
% stats(2).Aera = [1 2];


if  circleNum == 0,
    maxArea = 0;
    centroid = [-1 -1];
else
    maxArea = 0;
    for i = 1:size(stats)
        item = stats(i),
        if item.Area > maxArea,
            maxArea = item.Area;
            centroid = item.Centroid;
        end
    end
end

fprintf(filename ,'%.14f, %d , %.3f, %.3f , %.3f\n',time,circleNum, maxArea , centroid(1,1),centroid(1,2));
