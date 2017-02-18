video_name='video.avi'; 
writerObj=VideoWriter(video_name,'Uncompressed AVI');
writerObj.FrameRate = 2;
open(writerObj);
for i = 1:50
    frame = imread(['F:\ProgramProject\ECEI-loaddata\dataTag\42987_inst\42987ECEI_ [6.554-6.556]',num2str(i),'.png']);
    writeVideo(writerObj,frame);
end
close(writerObj);
