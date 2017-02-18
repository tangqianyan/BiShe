
import math

str_input_name = "42999result_attributes.txt"
str_dist_name = "dist.txt"

fid =  open(str_input_name,'r')
fid_dist = open(str_dist_name,'a+')

lines = fid.readlines()
pre_x = 0
pre_y = 0
for line in lines:
    line = line.split(',')
    distance = math.sqrt((float(line[-2])-pre_x)*(float(line[-2])-pre_x)+(float(line[-1])-pre_y)*(float(line[-1])-pre_y))
    pre_x = float(line[-2])
    pre_y = float(line[-1])
    if float(line[2]) >5000:
        distance = 0.0;
    if distance > 20:
        distance = 0.0
    print >> fid_dist,"%s , %.3f" %(line[0],distance)

fid_dist.close()