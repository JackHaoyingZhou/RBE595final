% prompt = 'Please input the number of vertices: \n';
% num = input(prompt);
% %num = 6;
% [x,y,dt] = simple_polygon(num);
% vertices = [x';y'];
% %polygon_plot(vertices,'b')
% 
% figure(1)
% plot(x,y)
% 
% hold on;

mod = py.importlib.import_module('linesegment_collision');

l0 = [0,1;0,2];
l1 = [0,1;0,6];
flag = mod.is_intersected(l0,l1);
flag1 = logical(flag.data)
% isequal(flag, 0)
%%%%%%%%% viscircles(center,radius);

%%%%%% how to plot
% time = 100;
% [x,y,dt] = simple_polygon(6);
% [x1,y1,dt1] = simple_polygon(6);
% figure(1)
% for t = 1:time
%    %fplot(@(x) sin(x*50/t),[0,2*pi]);  % plot
%    plot(x,y);  % plot
%    hold on;
%    plot(x1,y1);
%    hold off;
%    y1 = y1 + 0.01;
%    ylim([0,2]);                      % guarantee consistent height
%    F(t) = getframe;                   % capture it
% end
% 
% writerObj = VideoWriter('test2.avi');
% open(writerObj);
% writeVideo(writerObj, F)
% close(writerObj);
