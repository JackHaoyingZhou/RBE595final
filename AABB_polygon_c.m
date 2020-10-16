function [flag,i_test] = AABB_polygon_c(vertices_A,vertices_B)
flag = false;
[rec_A,~] = build_AABB(vertices_A);
[rec_B,~] = build_AABB(vertices_B);
tree_A = build_tree(vertices_A);
tree_B = build_tree(vertices_B);
i_test = 0;

if AABB_collision(rec_A,rec_B)
    leaf_A = AABB_check_cell(tree_B,vertices_A);
    if ~isempty(leaf_A)
        for i_A = 1:size(leaf_A,1)
            leaf_B = AABB_check_cell(tree_A,leaf_A{i_A});
            if ~isempty(leaf_B)
                [flag1,i_t] = primitive_test(leaf_A,leaf_B,'line');
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