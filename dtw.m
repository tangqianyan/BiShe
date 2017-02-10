function d  = dtw(Q,C,w)
% Dynamic Time Warping
% get the distance of two sequences 
% Q,C: two sequences  
% w: window parameter
%      if Q(i) is matched with C(j) then |i-j|<=w
% d: resulting distance
%
% Jingchang Liu 2016/04/11

    if nargin<3
        w=Inf;
    end

    %% initialize DTW
    % DTW(i+1,j+1): The accumulated distance between
    %   Q(1) to Q(i) and C(1) to C(j)
    % M: the length of sequence Q
    % N: the length of sequence C
    M = length(Q);
    N = length(C);
    w_value = round(M*w);
    w_value = max([w_value,abs(M-N)]);
    DTW = zeros(M+1,N+1)+Inf;
    DTW(1,1) = 0;

    %% DTW algorithm
    % d(i,j):The distance between Q(i) and C(j)
    for i = 1:M
        for j = max([1,i-w_value]) : min([N,i+w_value])
            d = norm(Q(i)-C(j));
            DTW(i+1,j+1) = d+ min([DTW(i,j+1),DTW(i+1,j),DTW(i,j)]);
        end
    end

    d = DTW(M+1,N+1);
end
