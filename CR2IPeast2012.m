function [IP,CH]=CR2IPeast2012(CHANNEL,ROW)
    MIP=[106 112;105 111;104 110;109 115;108 114;107 113]; 
    if rem(ROW,8)==0      
        Row=8;
    else
        Row=rem(ROW,8);
    end
    
    if rem(CHANNEL,4)==0
        Channel=4;
    else
        Channel=rem(CHANNEL,4);
    end
    %--------------------------------------------------------------------------
    IP=MIP(ceil(CHANNEL/4),ceil(ROW/8));
    CH=8*(Channel-1)+Row;
end