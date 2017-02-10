function [IP,CH]=CR2IPeast2014(Channel,Row)

load eceichannelnumberEAST2014
 ippage=1;
 chpage=2;
IP=eceichannelnumberEAST2014(Row,Channel,ippage);
CH=eceichannelnumberEAST2014(Row,Channel,chpage);
