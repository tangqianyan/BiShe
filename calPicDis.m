function dis = calPicDis(A,B)



Anmax = max(max(A));
Anmin = min(min(A));
A = (A-Anmin)/ (Anmax-Anmin);

Bnmax = max(max(B));
Bnmin = min(min(B));
B = (B-Bnmin)/ (Bnmax-Bnmin);

thresA = graythresh(A);
thresB = graythresh(B);
A =im2bw(A,thresA);
B =im2bw(B,thresB);

R = xor(A,B);
dis = sum(R(:))

end

