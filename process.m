clear;

% -----------------set configuration---------------------
ShotList = load('.\config\ShotNumber.txt'); 
duration = 0.002;  % ÿ�ν�ȡ��ʱ���
beginTime = 6.512;
endTime = 6.514;
t=[beginTime beginTime + duration];  % ��ʼʱ�� 
nstep=50;   % ʱ���ĸ���
t_row = t;
CH=24;
ROW=16;
for shot_i = 1:size(ShotList)
    shot = ShotList(shot_i);
    
    while t(2) <= endTime;
        T0=linspace(t(1),t(2),nstep); % ����nstep��ʱ���
        if  shot<44000
            DIR='F:\ProgramProject\ECEI-loaddata\';
        elseif  shot<60000
            DIR='F:\ProgramProject\ECEI-loaddata\';
        else
            DIR='F:\ProgramProject\ECEI-loaddata\';
        end
        %�ж�·���Ƿ����;
        path=[pwd,'\data\',num2str(shot)];
        if ~isdir(path)
            mkdir(path);
        end
        % ��ȡ���ʱ����λ��
        [data0,T_sigal]=loadeceieast1(shot,1, 1, t,1e6,1,DIR);
        for step_i=1:nstep  
            [temp,N(step_i)]=min(abs(T_sigal-T0(step_i)));
        end
        T=T_sigal(N);
        % --------------------Create New Matrix---------------------------
        for i=1:CH
            for j=1:ROW
                % data��ECEI��ѹ�źţ������ڵ�����������¶ȣ�;
                [data0,T_sigal]=loadeceieast1(shot, i, j, t,1e6,1);
%                 data0=highp(data0,50,100,0.1,20,1000000);
%                 data0 = bandpassFilter(data0);
                data0 = eceiFilter(data0,0.002);
%                 data0 = medfilt1(data0,3);
                data1=mean(data0);
                data2=(data0-data1)./data1;%�¶��Ŷ���
                data(i,j,:)=data2(N);
            end
        end
        str_attribute = strcat(path,'result_attributes.txt');
        fid_attribute = fopen(str_attribute,'a');

        for i = 1:nstep
            A = data(:,:,i);
            circleNumber = 0;
            [circleNumber,stats,thres,rects,bund,interpMatrix] = judgeCircle(A,100,0.04,i);
            recordAttribute(fid_attribute,circleNumber,stats,T(i));
            if circleNumber > 0
                drawTag(shot,interpMatrix,t,rects,i,bund);
            else
                drawTag(shot,interpMatrix,t,[],i,[]);
            end
        end
        
       t = t +  duration ;      
       clear T_sigal data0 data1 data2 A;
       fclose(fid_attribute);
    end
    t =t_row;


end

