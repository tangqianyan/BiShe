function [data,t]=loadeceieast1(SHOT,Channel,Row,Time,Fs,default,DIR)
%-----------------------------SET DEFAULT----------------------------------
if ~exist('FS','var'),
    Fs=1e6;
end
if ~exist('default','var')
    default=0;
end
if ~exist('DIR','var')
%     DIR = 'M:\home\admin\EAST-ECEI-2014\';
   DIR='F:\ProgramProject\ECEI-loaddata\';
end

%-------------------------------MAKE SHOTDIR-------------------------------
if SHOT<44000
    [IP,CH]=CR2IPeast2012(Channel,Row);
    PRE=1e5; %The number of data acquisition before triger 
elseif SHOT<60000
    [IP,CH]=CR2IPeast2014(Channel,Row);
%     PRE=1e5;
    PRE=83e3; %For EAST2014, ECEI trigger time delay 17ms
else
	[IP,CH]=CR2IPeast2015(Channel,Row);
    PRE=1e5;
end
shotdir=[DIR,'SHOT.',sprintf('%06d', SHOT),'\acq132_',int2str(IP),'\CH',sprintf('%02d', CH)];

%------------------------------READ DATA-----------------------------------
tmp=scan(shotdir,Time,Fs,PRE);
if PRE~=0
    tmpPRE=scan(shotdir,[0,PRE/Fs],Fs,0);
end
%------------------------------NARGOUT--------------------------------------
if default~=0
    data=tmp-mean(tmpPRE);
else
    data=tmp;
end
if (Time(2)-Time(1))>length(data)/Fs
    Time(2)=length(data)/Fs+Time(1);
end
t=linspace(Time(1),Time(2),length(data));