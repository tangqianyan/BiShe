% calculate accuracy of judgement
%
% jcl 2016/5/14

load shot_data.mat;
load judgement_result.mat;

train_set = [1 2 3 4 6 7 8 10]';
result = ones(24,16)*NaN;
min_dist = ones(24,16)*inf;

% for all elements in shot_57241
for row = 1:16
    for ch = 1:24
        for p = 1:8
            for row2 = 1:16
                for ch2 = 1:24
                    dtw_distance = dtw(shot_data{11}{ch,row},shot_data{train_set(p)}{ch2,row2},0.05);
                    if dtw_distance < min_dist(ch,row)
                        min_dist(ch,row) = dtw_distance;
                        result(ch,row) = judgement_cell{train_set(p)}(ch2,row2);
                    end
                end
            end
        end
    end
end

