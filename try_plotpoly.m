prompt = 'Please input the number of vertices: \n';
num = input(prompt);
%num = 6;
[x,y,dt] = simple_polygon(num);
vertices = [x';y'];
%polygon_plot(vertices,'b')

figure(1)
plot(x,y)

hold on;
