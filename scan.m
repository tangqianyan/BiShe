function tmp=scan(shotdir,Time,FS,PRE)
    fid=fopen(shotdir,'r');
    if fid<0
        error(['Can''t open: ' shotdir,',please check your DIR of datastorge!!']);
    end
    if length(Time)<2||Time(1)>=Time(2)
        error('The TIME must be a timeslice,and Time must be Time(1)=<Time(2) ');
    end
    if ~exist('FS','var')
        FS=1e6;
    end
    if ~exist('PRE','var')
        PRE=0;
    end
    ind1=round(Time(1)*FS);
    ind2=round((Time(2)-Time(1))*FS);
    %--------------------------------------------------------------------------
    fseek(fid,(ind1+PRE)*2,'bof');
    tmp=fread(fid, ind2, 'int16')/2^15;
fclose(fid);