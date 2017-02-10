% piecewise aggregate representation of sequence
% jcl 2016/5/12
%
% seq: original sequence
% n: 
% PAA_seq: paa representation of original sequence
% t_new: 

function PAA_seq = PAA(seq,n);
    % to make seq can be divided by PAA_seq
    length_seq = length(seq);
    length_PAA_seq = floor(length_seq/n);
    PAA_seq = ones(length_PAA_seq,1);
    select_to_discard = floor(linspace(1,length_seq,mod(length_seq,n)));
    seq(select_to_discard) = [];
    length_seq = length(seq);
    
    % PAA
    index = ones(n,length_PAA_seq);
    for p = 1:n
        index(p,:) = p:n:length_seq;
    end
    
    for q = 1:length_PAA_seq
        PAA_seq(q) = sum(seq(index(:,q)))/n;
    end
end
