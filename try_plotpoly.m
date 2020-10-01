prompt = 'Please input the number of vertices: \n';
num = input(prompt);
%num = 6;
[x,y,dt] = simple_polygon(num);
plot(x,y)
hold on;
