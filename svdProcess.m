function [newMatrix,reU,reS] = svdProcess(data)

dimension = size(data);

for time_indx = 1: dimension(3)
    for chan_indx = 1: dimension(1)
        for row_indx = 1: dimension(2)
            tmpMatrix(time_indx,(chan_indx-1)*dimension(2) + row_indx) = data(chan_indx,row_indx,time_indx);
        end
    end
end


% [A_hat E_hat ] =rpca(tmpMatrix);
% tmpMatrix = A_hat;

[u,s,v] = svds(tmpMatrix,6);
% tmpMatrix = u*s*v';
reS = s;
reU = u;
newMatrix = tmpMatrix;
drawNoisr(newMatrix);
% dimension = size(tmpMatrix)
% CH=24;
% RW=16;
% for r_indx = 1: dimension(1)
%     for c_indx = 1: dimension(2)
%         c_i = mod(c_indx,RW) ;
%         if c_i == 0,
%             c_i = RW;
%         end
%             
%         newMatrix(floor((c_indx-1)/RW)+1,c_i,r_indx)=tmpMatrix(r_indx,c_indx);
%     end
% end
end