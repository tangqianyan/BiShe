function dist=dtw_func(compare_to_this_object,unknow_object)
    format long e;
    m=size(compare_to_this_object);
    n=size(unknow_object);
    c = ones(m(3),n(3));
%     c = ones(m,n);

    for i = 1:m(3)     %���Կ����������㷨�а�a����
        for j = 1:n(3)
            tmp= (calPicDis(compare_to_this_object(:,:,i),unknow_object(:,:,j)))^2;      %ŷʽ����   
%             tmp= (compare_to_this_object(i)-unknow_object(j))^2;
            if j == 1&& i == 1
                c(i,j) = tmp;   %�����c(1,1)�����ð����ۻ����룬ֱ����ŷ�Ͼ���
            elseif j>1
                c(i,j) = c(i,j-1) + tmp;    %�����Ŀ����ۻ�����
            end
            
            if  i>1     %��һ�к������е������̫һ�������Էֿ�����
                if j==1     %����i>1ʱ����һ�е�ֵֻ����ŷ�Ͼ�������ۼƾ���
                    c(i,j) = tmp + c(i-1,j);
                else         %�ų����������֮�������ĸ����㷨���㣬ѡ����С���ۻ�����+ŷ�Ͼ���
                    test1 = [c(i,j-1),c(i-1,j-1),c(i-1,j)];      %��Ϊmin()�Ĳ����Ǿ���û��ֱ��ʹ��3������
                    c(i,j) = tmp + min(test1);
                end
            end
            
        end
    end
    dist=c(m(3),n(3));  %��С�ľ���
    
end