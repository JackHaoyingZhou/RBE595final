function [flag] = AABB_polygon_c(vertices_A,vertices_B)
flag = false;
% [rec_A,~] = build_AABB(vertices_A);
% [rec_B,~] = build_AABB(vertices_B);
num_A = size(vertices_A,1);
num_B = size(vertices_B,1);
v_1 = vertices_A;
v_2 = vertices_B;
num_iter1 = ceil(log2(num_A))-2;
num_iter2 = ceil(log2(num_B))-2;
ind_A = num_A;
ind_B = num_B;
leaf_A = cell(2^num_iter1,1);
leaf_B = cell(2^num_iter2,1);

for i_A = 1:num_iter1
    
    if 
end
    



if flag
    plot(rec_1(:,1),rec_1(:,2),'color','r','Linewidth',2);
    plot(rec_2(:,1),rec_2(:,2),'color','r','Linewidth',2);
end
end