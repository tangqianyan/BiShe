function dist=dtw_func(compare_to_this_object,unknow_object)
    format long e;
    m=size(compare_to_this_object);
    n=size(unknow_object);
    c = ones(m(3),n(3));
%     c = ones(m,n);

    for i = 1:m(3)     %可以看出这里在算法中把a竖着
        for j = 1:n(3)
            tmp= (calPicDis(compare_to_this_object(:,:,i),unknow_object(:,:,j)))^2;      %欧式距离   
%             tmp= (compare_to_this_object(i)-unknow_object(j))^2;
            if j == 1&& i == 1
                c(i,j) = tmp;   %如果是c(1,1)，则不用包含累积距离，直接用欧氏距离
            elseif j>1
                c(i,j) = c(i,j-1) + tmp;    %其他的考虑累积距离
            end
            
            if  i>1     %第一行和其他行的情况不太一样，所以分开考虑
                if j==1     %而当i>1时，第一列的值只能是欧氏距离加上累计距离
                    c(i,j) = tmp + c(i-1,j);
                else         %排除了特殊情况之后，其他的根据算法计算，选出最小的累积距离+欧氏距离
                    test1 = [c(i,j-1),c(i-1,j-1),c(i-1,j)];      %因为min()的参数是矩阵，没法直接使用3个参数
                    c(i,j) = tmp + min(test1);
                end
            end
            
        end
    end
    dist=c(m(3),n(3));  %最小的距离
    
end