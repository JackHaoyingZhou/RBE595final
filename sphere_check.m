clear all
close all
clc

num_A = 6;
num_B = 8;

[x_A,y_A,dt_A] = simple_polygon(num_A);
vertices_A = [x_A,y_A];
[x_B,y_B,dt_B] = simple_polygon(num_B);
vertices_B = [x_B,y_B];
% v_A = [vertices_A; vertices_A(1,:)];
% v_B = [vertices_B; vertices_B(1,:)];
% num_A = size(vertices_A,1);
% num_B = size(vertices_B,1);

tStart = tic;
time = 100;
figure(1)
T = zeros(1,time);
for t = 1:time
    %tic
    plot(vertices_A(:,1),vertices_A(:,2),'b','Linewidth',2);  % plot
    hold on;
    grid on;
    plot(vertices_B(:,1),vertices_B(:,2),'k','Linewidth',2);
    
    
    %%%%%%%% build the big sphere for the object
    flag = sphere_polygon(vertices_A,vertices_B,num_A,num_B);
    if flag
        txt = 'collision: true';
    else
        txt = 'collision: false';
    end
    text(0,2,txt)
    %%%%%%% plot
%     if sphere_collision(c_A,c_B,r_A,r_B)
%         color = 'r';
%     else
%         color = 'g';
%     end
%     viscircles(c_A,r_A,'color',color);
%     viscircles(c_B,r_B,'color',color);
    
    % guarantee consistent height
    xlim([-1,2.5]);
    ylim([-1,2.5]);
    vertices_B = vertices_B + [0.01,0.01];
%     c_B(2) = c_B(2) + 0.01;
    % capture it
    hold off;
    F(t) = getframe;
    %T(t) = toc;
end
tMul = sum(T)
tEnd = toc(tStart)

%%%%%% write frames to file
% writerObj = VideoWriter('test2.avi');
% open(writerObj);
% writeVideo(writerObj, F)
% close(writerObj);