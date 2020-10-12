clear all
close all
clc

load('test1.mat');

tStart = tic;
time = 100;
theta = 2*pi/time;
R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
figure(1)
T = zeros(1,time);
for t = 1:time
    tic
    plot(vertices_A(:,1),vertices_A(:,2),'b','Linewidth',2);  % plot
    hold on;
    grid on;
    plot(vertices_B(:,1),vertices_B(:,2),'k','Linewidth',2);
    
    
    [rec_A_total,rec_A_plot_total] = build_AABB(max(vertices_A),min(vertices_A));
    [rec_B_total,rec_B_plot_total] = build_AABB(max(vertices_B),min(vertices_B));
    
    %color = 'r';
    
    
    %%%%%%%% build the big sphere for the object
    flag = AABB_polygon(vertices_A,vertices_B,num_A,num_B);
    if flag
        txt = 'collision: true';
    else
        txt = 'collision: false';
    end
    text(0.0,2.5,txt)
    %%%%%% plot
%     if AABB_collision(rec_A_total,rec_B_total)
%         color = 'r';
%     else
%         color = 'g';
%     end
    
%     plot(rec_A_plot_total(:,1),rec_A_plot_total(:,2),color,'Linewidth',2);  % plot
%     %hold on;
%     plot(rec_B_plot_total(:,1),rec_B_plot_total(:,2),color,'Linewidth',2);

    
    % guarantee consistent height
    xlim([-2.0,3.0]);
    ylim([-2.0,3.0]);
    %vertices_B = vertices_B + [0.01,0.01];
    %vertices_B = vertices_B + [0.05,0.05];
    %vertices_B = (R*(vertices_B'))' + [0.05,0.05];
    vertices_B = (R*(vertices_B'))';
    %vertices_B = vertices_B + [0.01,0.01];
    % capture it
    hold off;
    F(t) = getframe;
    T(t) = toc;
end
tMul = sum(T)
tEnd = toc(tStart)

%%%%%% write frames to file
% writerObj = VideoWriter('test2.avi');
% open(writerObj);
% writeVideo(writerObj, F)
% close(writerObj);