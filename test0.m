% % tic
% % %%%% measure time by tic and toc
% % prompt = 'input matrix:\n';
% % s = input(prompt);
% % toc
% % disp('the value of s is:');
% % disp(s)
% % str = inputdlg('Enter a list of numbers separated by spaces or commas');
% % numbers = str2num(str{1});
% 
% % v1 = [0,0];
% % v2 = [3,0];
% % pt = [0,5;0,10;0,15];
% % distance_2D = point_to_line_distance(pt, v1, v2);
% % disp(distance_2D)
% 
% rec_A = [0.7902,0.9214;0.3530,1.0429;0.1131,0.1797;0.5503,0.0582];
% rec_B = [0.4494,0.4303;0.0273,-0.1029;0.7578,-0.6812;1.1799,-0.1480];
% norm_vec = [-0.7841;0.6207];
% 
% rec_A_plot = [rec_A;rec_A(1,:)];
% rec_B_plot = [rec_B;rec_B(1,:)];
% 
% plot(rec_A_plot(:,1),rec_A_plot(:,2),'b','Linewidth',2);  % plot
% hold on;
% plot(rec_B_plot(:,1),rec_B_plot(:,2),'k','Linewidth',2);
% 
% plot([0,norm_vec(1)],[0,norm_vec(2)],'r');

%for k = 1:5
%     disp(k)
% end
% 
% for i = 1:5
%     for j = 1:5
%         if i>3
%             disp(i)
%             return;
%         end
%     end
% end

plot(vertices_A(:,1),vertices_A(:,2),'b','Linewidth',2);  % plot
hold on;
grid on;
plot(vertices_B(:,1),vertices_B(:,2),'k','Linewidth',2);

points_1 = dt_A.X;
points_2 = dt_B.X;
for i = 1:size(dt_A.Triangulation,1)
    idx = dt_A.Triangulation(i,:);
    point_A = points_1(idx(1),:);
    point_B = points_1(idx(2),:);
    point_C = points_1(idx(3),:);
    pt_mtx = [point_A;point_B;point_C;point_A];
    plot(pt_mtx(:,1),pt_mtx(:,2),'r','Linewidth',2);
end

for j = 1:size(dt_B.Triangulation,1)
    idy = dt_B.Triangulation(j,:);
    point_A1 = points_2(idy(1),:);
    point_B1 = points_2(idy(2),:);
    point_C1 = points_2(idy(3),:);
    pt_mtx1 = [point_A1;point_B1;point_C1;point_A1];
    plot(pt_mtx1(:,1),pt_mtx1(:,2),'g','Linewidth',2);
end
