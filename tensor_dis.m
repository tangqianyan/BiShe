ShotList = load('.\config\ShotNumber.txt');
duration = 0.02;
nstep = 50;
for i =1:size(ShotList)
    shot = ShotList(i);
    str = strcat('.\data\',num2str(shot),'svd_result.txt');
    str_cor = strcat('.\data\',num2str(shot),'_tensor_correlation.txt');
    fid_cor = fopen(str_cor,'a');
    timeList = load(str);

    for j = 1:size(timeList)
        list1 = createMax(shot,[timeList(j) timeList(j)+duration],nstep);
        [r1,r_v1] = tensor_hosvd(list1);
        for k = j+1:size(timeList)
            list2 =  createMax(shot,[timeList(k) timeList(k)+duration],nstep);
            [r2,r_v2] = tensor_hosvd(list2);
            dis = tensor_angle(r_v1,r_v2)
            dist(j).bg = timeList(j);
            dist(j).ed = timeList(k);
            dist(j).dt = dis
            fprintf(fid_cor,'%.3f\t%.3f\t%.5f\n',timeList(j),timeList(k),dis);
        end
    end
end
fclose(fid_cor);