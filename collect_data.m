clear all
close all
clc

num_A = 3;
num_B = 3;

[x_A,y_A,dt_A] = simple_polygon(num_A);
vertices_A = [x_A,y_A];
[x_B,y_B,dt_B] = simple_polygon(num_B);
vertices_B = [x_B,y_B];

plot(vertices_A(:,1),vertices_A(:,2),'b','Linewidth',2);  % plot
hold on;
grid on;
plot(vertices_B(:,1),vertices_B(:,2),'k','Linewidth',2);

save('test18')