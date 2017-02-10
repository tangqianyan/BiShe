% to read judgement result
%
% jcl   2016/5/14

sheet = [42987 42999 47489 49024 51063 51064 ...
    51075 51078 52327 52532 57241 57243]';
judgement_cell = cell(10,1);

for p = 1:10
    judgement_cell{p} = xlsread('signal_judgement.xlsx',p,'B2:Q25');
end