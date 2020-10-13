clear all
close all
clc

load('test1.mat');

%vertices_B = vertices_B + [0.01,0.01];

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
    
    
    [rec_A_total,rec_A_plot_total] = build_OBB(vertices_A(1:1:end-1,:),vertices_A(end,:));
    [rec_B_total,rec_B_plot_total] = build_OBB(vertices_B(1:1:end-1,:),vertices_B(end,:));
    
    %color = 'r';
    
    
    %%%%%%%% build the big sphere for the object
    flag = OBB_polygon(vertices_A,vertices_B,num_A,num_B);
    if flag
        txt = 'collision: true';
    else
        txt = 'collision: false';
    end
    text(0.0,2.5,txt)
    %%%%%% plot
%     if OBB_collision(rec_A_total,rec_B_total)
%         color = 'r';
%     else
%         color = 'g';
%     end
% %     color = 'r';
%     plot(rec_A_plot_total(:,1),rec_A_plot_total(:,2),color,'Linewidth',2);  % plot
%     %hold on;
%     plot(rec_B_plot_total(:,1),rec_B_plot_total(:,2),color,'Linewidth',2);

    
    % guarantee consistent height
    xlim([-2.0,3.0]);
    ylim([-2.0,3.0]);
    
    %%%%translation
    %vertices_B = vertices_B + [0.01,0.01];
    
    
    %%%%%%% rotation around specific point
    %vertices_B = vertices_B - [0.5,0.5];
    %vertices_B = (R*(vertices_B'))'+[0.5,0.5];
    
    
    %%%%%% rotation around origin
    vertices_B = (R*(vertices_B'))';
    
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