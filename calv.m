ShotList = load('.\config\ShotNumber.txt');

for i =1:size(ShotList)
    dist = [];
    shot = ShotList(i);
    str = strcat('.\data\',num2str(shot),'svd_result.txt');
    str_attribute = strcat('.\data\',num2str(shot),'result_attributes.txt');
    str_cor = strcat('.\data\',num2str(shot),'correlation.txt');
    fid_cor = fopen(str_cor,'a');
    timeList = load(str);

    for j = 3:size(timeList)
        fid = fopen(str_attribute,'r');
        list1 = [];
        tline = fgetl(fid);
        while ischar(tline)
            S = regexp(tline, ',', 'split');
            if floor(str2num(char(S(1)))*1000) == floor(timeList(j)*1000) || floor(str2num(char(S(1)))*1000) == floor(timeList(j)*1000)+1 ||floor(str2num(char(S(1)))*1000) == floor(timeList(j)*1000)+2
                if str2num(char(S(4))) ~= -1
                    list1 = [list1;str2num(char(S(4)))/str2num(char(S(5)))];
                end
            end
            tline = fgetl(fid);
        end
        fclose(fid);
        
        for k = j+1:size(timeList)
            fid = fopen(str_attribute,'r');
            tline = fgetl(fid);
            list2 = [];
            while ischar(tline)
                S = regexp(tline, ',', 'split');
                if floor(str2num(char(S(1)))*1000) == floor(timeList(k)*1000) || floor(str2num(char(S(1)))*1000) == floor(timeList(k)*1000)+1 ||floor(str2num(char(S(1)))*1000) == floor(timeList(k)*1000)+2
                    if str2num(char(S(4))) ~= -1
                        list2 = [list2;str2num(char(S(4)))/str2num(char(S(5)))];
                    end
                end
                tline = fgetl(fid);
            end
            dis = dtwPic(list1,list2);
            fclose(fid);
            dist(j).bg = timeList(j);
            dist(j).ed = timeList(k);
            dist(j).dt = dis
            fprintf(fid_cor,'%.3f\t%.3f\t%.3f\n',timeList(j),timeList(k),dis);
        end
    end
end
fclose(fid_cor);