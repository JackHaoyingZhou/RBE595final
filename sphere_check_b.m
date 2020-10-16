clear all
close all
clc

load('test6.mat');
% prompt = 'input number of edges for two polygon as [a,b]:\n';
% s = input(prompt);
% num_A = s(1);
% num_B = s(2);
% %disp(s)
% [x_A,y_A,dt_A] = simple_polygon(num_A);
% vertices_A = [x_A,y_A];
% [x_B,y_B,dt_B] = simple_polygon(num_B);
% vertices_B = [x_B,y_B];
% v_A = [vertices_A; vertices_A(1,:)];
% v_B = [vertices_B; vertices_B(1,:)];
% num_A = size(vertices_A,1);
% num_B = size(vertices_B,1);

time = 100;
d = 0.5*1.0/time;
figure(1)
T = zeros(1,time);
theta = 2*pi/time;
R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
T_p = 0;
I_ptest = 0;
I_btest = 0;
for t = 1:time
    % plot polygon*
    plot(vertices_A(:,1),vertices_A(:,2),'b','Linewidth',2);
    hold on;
    grid on;
    plot(vertices_B(:,1),vertices_B(:,2),'k','Linewidth',2);
    
    
    %%%%%%%% main program
    tStart = tic;
    [flag, i_ptest,i_btest, t_p] = sphere_polygon(vertices_A,vertices_B);
    T(t) = toc(tStart);
    
    
    T_p = T_p + t_p;
    I_ptest = I_ptest + i_ptest;
    I_btest = I_btest + i_btest;
    if flag
        txt = 'collision: true';
    else
        txt = 'collision: false';
    end
    text(0,2,txt)
    
    % guarantee consistent height
    xlim([-2.0,3.0]);
    ylim([-2.0,3.0]);
    
    
    %%%%translation
    %vertices_B = vertices_B + [d,d];
    
    
    %%%% rotation around specific point
    vertices_B = vertices_B - [0.5,0.5];
    vertices_B = (R*(vertices_B'))'+[0.5,0.5];
    
    
    %%%%%% rotation around origin
    %vertices_B = (R*(vertices_B'))';
    
    %%%%%%% capture frame
    hold off;
    F(t) = getframe;
end
tMul = sum(T);

disp('Time for primitive test (s)')
disp(T_p)
disp('Number of BV tests')
disp(I_btest)
disp('Total time (s)')
disp(tMul)


%%%%%% write frames to file
% writerObj = VideoWriter('test2.avi');
% open(writerObj);
% writeVideo(writerObj, F)
% close(writerObj);