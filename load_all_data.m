% to load all the ECEI data
%
% jcl 2016/5/13

clear,clc
% SHOT to load
shot = [52532 57241 57243]';
% IP to load
IP = 1:24;
% CH to load
CH = 1:16;

% built cell 
shot_cell = cell(3,1);
for n = 1:3
    shot_cell{n} = cell(24,16);
end

% store
for shot_index = 1:3
    for IP_index = 1:24
        for CH_index = 1:16
            [shot_cell{shot_index}{IP_index,CH_index},t] = ...
                loadeceieast1(shot(shot_index),IP(IP_index),CH(CH_index),[0,10]);
            shot_cell{shot_index}{IP_index,CH_index} = ...
                PAA(shot_cell{shot_index}{IP_index,CH_index},10000);
        end
    end
end
