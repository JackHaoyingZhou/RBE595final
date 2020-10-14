clear all
close all
clc

load('test1.mat');
% v_A = [vertices_A; vertices_A(1,:)];
% v_B = [vertices_B; vertices_B(1,:)];
% num_A = size(vertices_A,1);
% num_B = size(vertices_B,1);

tStart = tic;
time = 100;
figure(1)
T = zeros(1,time);
theta = 2*pi/time;
R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
for t = 1:time
    tic
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
    xlim([-2.0,3.0]);
    ylim([-2.0,3.0]);
    %%%%translation
    vertices_B = vertices_B + [0.01,0.01];
    
    
    %%%%%%% rotation around specific point
    %vertices_B = vertices_B - [0.8,0.8];
    %vertices_B = (R*(vertices_B'))'+[0.8,0.8];
    
    
    %%%%%% rotation around origin
    %vertices_B = (R*(vertices_B'))'
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