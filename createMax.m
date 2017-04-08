function data = createMax(shot,t,nstep)
CH=24;
ROW=16;
        T0=linspace(t(1),t(2),nstep); % 生成nstep个时间点
        if  shot<44000
            DIR='F:\ProgramProject\ECEI-loaddata\';
        elseif  shot<60000
            DIR='F:\ProgramProject\ECEI-loaddata\';
        else
            DIR='F:\ProgramProject\ECEI-loaddata\';
        end
        %判断路径是否存在;
        path=[pwd,'\data\',num2str(shot)];
        if ~isdir(path)
            mkdir(path);
        end
        % 求取最近时间点的位置
        [data0,T_sigal]=loadeceieast1(shot,1, 1, t,1e6,1,DIR);
        for step_i=1:nstep  
            [temp,N(step_i)]=min(abs(T_sigal-T0(step_i)));
        end
        T=T_sigal(N);
        % --------------------Create New Matrix---------------------------
        for i=1:CH
            for j=1:ROW
                [data0,T_sigal]=loadeceieast1(shot, i, j, t,1e6,1);
                data0 = eceiFilter(data0,duration);
                data1=mean(data0);
                data2=(data0-data1)./data1;%温度扰动；
                data(i,j,:)=data2(N);
            end
        end
end
