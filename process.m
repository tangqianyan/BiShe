clear;

% -----------------set configuration---------------------
ShotList = load('.\config\ShotNumber.txt'); 
duration = 0.1;  % ÿ�ν�ȡ��ʱ���
t=[5.14 5.14+duration];  % ��ʼ����ʱ�� 
nstep=8;   % ʱ���ĸ���
t_row = t;
CH=24;
ROW=16;
% ��������
% CHH=linspace(CH,1,CH);
% RWW=linspace(ROW,1,ROW);
% [RWW,CHH]=meshgrid(RWW,CHH);
%ȡ�����ʱ�̵㣻
for shot_i = 1:size(ShotList)
    shot = ShotList(shot_i);
    
    while t(2) <= 5.24;
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
                %         data1=smooth(data0,500);
                data1=mean(data0);
                data2=(data0-data1)./data1;%�¶��Ŷ���
                data(i,j,:)=data2(N);
            end
        end


        %--------------------Create Result File--------------------------
        str_inst = strcat(path,'result_interested.txt');
        str_uninst = strcat(path,'result_uninterested.txt');
        fid_inst = fopen(str_inst,'a');
        fid_uninst = fopen(str_uninst,'a');

        for i = 1:nstep
            A = data(:,:,i);
            circleNumber = 0;
            [circleNumber,stats,thres,rects,bund,interpMatrix] = judgeCircle(A,100,0.04,i)
            if circleNumber > 0
                drawTag(shot,interpMatrix,t,rects,i,bund);
                fprintf(fid_inst ,'%.14f %d\n',T(i),circleNumber);
            else
                drawTag(shot,interpMatrix,t,[],i,[]);
                fprintf(fid_uninst ,'%.14f\n',T(i));
            end
        end
        
       t = t +  0.1;
       clear T_sigal data0 data1 data2 A;
           
    end
    t =t_row;
    fclose(fid_inst);
    fclose(fid_uninst);

end

