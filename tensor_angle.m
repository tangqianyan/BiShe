function dis = tensor_angle(A,B)
dis = 0;
m = size(A,2);
minAgl = 400;
for i = 1:m
    ASlice = double(A{i});
    BSlice = double(B{i});
    for j = 1:size(ASlice,2)
        pt = ASlice(:,j)'*BSlice(:,j);
        if acos(pt) < minAgl
            minAgl = acos(pt);
        end
    end
    dis = dis +sin(minAgl)^2;
    minAgl = 400;
end