clear all
close all
clc

num_A = 8;
num_B = 10;

[x_A,y_A,dt_A] = simple_polygon(num_A);
vertices_A = [x_A,y_A];
[x_B,y_B,dt_B] = simple_polygon(num_B);
vertices_B = [x_B,y_B];

save('test1','num_A','num_B','vertices_A','vertices_B')