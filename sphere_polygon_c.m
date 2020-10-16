function [flag, i_test] = sphere_polygon_c(vertices_A,vertices_B)
flag = false;
i_test = 0;
[r_A,c_A] = build_sphere(vertices_A);
[r_B,c_B] = build_sphere(vertices_B);
% num_A = size(vertices_A,1);
% num_B = size(vertices_B,1);
% v_1 = vertices_A;
% v_2 = vertices_B;
% num_iter1 = ceil(log2(num_A))-2;
% num_iter2 = ceil(log2(num_B))-2;
% idx_1 = size(v_1,1);
% idx_2 = size(v_2,1);
% leaf_A = cell(2^num_iter1,1);
% leaf_B = cell(2^num_iter2,1);
tree_A = build_tree(vertices_A);
tree_B = build_tree(vertices_B);
% i_iterA = size(tree_A,2);
% i_iterB = size(tree_B,2);

if sphere_collision(c_A,c_B,r_A,r_B)
    leaf_A = sphere_check_cell(tree_B,vertices_A);
    %isempty(leaf_A)
    if ~isempty(leaf_A)
        for i_A = 1:size(leaf_A,1)
            leaf_B = sphere_check_cell(tree_A,leaf_A{i_A});
            if ~isempty(leaf_B)
                [flag1, i_t] = primitive_test(leaf_A,leaf_B,'line');
                i_test = i_test + i_t;
                if flag1
                    flag = true;
                    return;
                end
            end
        end
    end
end
end

% if AABB_collision(rec_A,rec_B)
%     for i_A = 1:num_iter1
%         idx_1 = ceil(size(v_1,1)/2);
%         idx_2 = ceil(size(v_2,1)/2);
%         if idx_1 > 2 && idx_2 > 2
%             v_A = v_1(1:1:idx_1,:);
%             v_B = v_1(idx_1:1:end,:);
%         else
%             break;
%         end
% %         v_A = v_1(1:1:idx_1,:);
% %         v_B = v_1(idx_1:1:end,:);
% %         v_C = v_2(1:1:idx_2,:);
% %         v_D = v_2(idx_2:1:end,:);
%     end
% end
%     