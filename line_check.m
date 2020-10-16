clear all
close all
clc

load('test2.mat');
% prompt = 'input number of edges for two polygon as [a,b]:\n';
% s = input(prompt);
% num_A = s(1);
% num_B = s(2);
% %disp(s)
% [x_A,y_A,dt_A] = simple_polygon(num_A);
% vertices_A = [x_A,y_A];
% [x_B,y_B,dt_B] = simple_polygon(num_B);
% vertices_B = [x_B,y_B];


%vertices_B = vertices_B + [0.01,0.01];

tStart = tic;
time = 100;
d = 1.0/time;
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
    
    
    %[rec_A_total,rec_A_plot_total] = build_AABB(vertices_A);
    %[rec_B_total,rec_B_plot_total] = build_AABB(vertices_B);
    
    %color = 'r';
    
    
    %%%%%%%% build the big sphere for the object
    %flag = AABB_polygon_c(vertices_A,vertices_B,num_A,num_B);
    [flag,i_test] = line_test(vertices_A,vertices_B);
    i_test
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
    
    %%%%translation
    %vertices_B = vertices_B + [d,d];
    
    
    %%%%%%% rotation around specific point
    vertices_B = vertices_B - [0.5,0.5];
    vertices_B = (R*(vertices_B'))'+[0.5,0.5];
    
    
    %%%%%% rotation around origin
    %vertices_B = (R*(vertices_B'))';
    
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