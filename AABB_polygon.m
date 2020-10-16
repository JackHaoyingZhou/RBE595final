function [flag, i_ptest, i_btest ,t_p] = AABB_polygon(vertices_A,vertices_B)
flag = false;
[rec_A,~] = build_AABB(vertices_A);
[rec_B,~] = build_AABB(vertices_B);
tree_A = build_tree(vertices_A);
tree_B = build_tree(vertices_B);
i_btest = 0;
t_p = 0;
i_ptest = 0;

if AABB_collision(rec_A,rec_B)
    
    %%%%% BVTT1
    [leaf_A,i_1] = AABB_check_cell(tree_B,vertices_A);
    i_btest = i_btest + i_1;
    if ~isempty(leaf_A)
        for i_A = 1:size(leaf_A,1)
            %%%%%% BVTT2
            [leaf_B,i_2] = AABB_check_cell(tree_A,leaf_A{i_A});
            i_btest = i_btest + i_2;
            if ~isempty(leaf_B)
                for i_B = 1:size(leaf_B,1)
                    %%%% primitive tests
                    tic
                    flag1 = primitive_test(leaf_A{i_A},leaf_B{i_B});
                    i_ptest = i_ptest + 1;
                    T_p = toc;
                    t_p = t_p + T_p;
                    
                    if flag1
                        flag = true;
                        
                        %%%%% plot the leaf node
                        [~,rec_1plot] = build_AABB(leaf_A{i_A});
                        [~,rec_2plot] = build_AABB(leaf_B{i_B});
                        plot(rec_1plot(:,1),rec_1plot(:,2),'color','y','Linewidth',2);
                        plot(rec_2plot(:,1),rec_2plot(:,2),'color','y','Linewidth',2);
                        return;
                    end
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