clear
clc

y0 = [2 2]'; % C.I. [ x, dx, th, dth]

tfinal= 25;

[out,st] = massSpring(y0,tfinal);

 run plotRuning.m
