ShotList = load('.\config\ShotNumber.txt');
duration = 0.02;
nstep = 20;
for i =1:size(ShotList)
    shot = ShotList(i);
    str = strcat('.\data\',num2str(shot),'svd_result.txt');

    str_cor = strcat('.\data\',num2str(shot),'correlation.txt');
    fid_cor = fopen(str_cor,'a');
    timeList = load(str);

    for j = 3:size(timeList)
        list1 = createMax(shot,[timeList(j) timeList(j)+duration],20);

        
        for k = j+1:size(timeList)
            list2 =  createMax(shot,[timeList(k) timeList(k)+duration],20);
            dis = dtw_func(list1,list2);
            dist(j).bg = timeList(j);
            dist(j).ed = timeList(k);
            dist(j).dt = dis
            fprintf(fid_cor,'%.3f\t%.3f\t%.3f\n',timeList(j),timeList(k),dis);
        end
    end
end
fclose(fid_cor);