这里是对ECEI数据读取程序的解释：

1. loadeceieast1是读取EAST上ECEI数据的主程序。
输入参数：SHOT(EAST放电炮号，如52327)，Channel（ECEI极向道数，1~24，如12），Row（ECEI径向道数，1~16，如8），Time（读取时间，-0.1s~9.9s，如[3 4]），Fs（采样率，为1e6），default（为0或1，0表示读取原始数据（-1<data<1），1表示减去offset（0~data<2）），DIR（ECEI数据存储路径）
输出参数：data（ECEI电压信号，正比于等离子体电子温度），t（data对应放电测量时间）

2. CR2IPeast2012, CR2IPeast2014是将ECEI在等离子体中测量位置Channel,Row对应到采集卡通道
IP: ECEI共有12张采集卡，每张卡对应一个IP (104,105...115)并生成一个文件夹，每张卡有32个通道，即有12 X 32个信号道，分别对应ECEI 24（极向）X 16（径向）=384个观测位置。

3. scan 扫描数据中是否存在需要读取的信号道，并将存在信号的数据二进制格式转换为十进制格式导出，得到data. 


Authorized by ZHAO Zhenling, zzl1212@mail.ustc.edu.cn