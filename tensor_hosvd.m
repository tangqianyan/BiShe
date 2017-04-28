function [r_A,r_v] = tensor_hosvd(data)
r_s = tensor(data);
mode = length(r_s.size);
for i = 1:mode
    tmp = tenmat(data,i);
    [r_u{i},s,r_v{i}] = svd(tmp.data');
    r_s=ttm(r_s,r_v{i}',i);  
end
r_A = r_s;
for i = 1:mode
    r_A=ttm(r_A,r_v{i},i);  
end
end
