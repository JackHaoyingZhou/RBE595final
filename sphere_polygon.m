function [flag, i_ptest, i_btest ,t_p] = sphere_polygon(vertices_A,vertices_B)
%%%%% initialize
flag = false;
i_ptest = 0;
[c_A,r_A] = build_sphere(vertices_A);
[c_B,r_B] = build_sphere(vertices_B);
tree_A = build_tree(vertices_A);
tree_B = build_tree(vertices_B);
i_btest = 0;
t_p = 0;

if sphere_collision(c_A,c_B,r_A,r_B)
    
    %%%% BVTT1
    [leaf_A, i_1] = sphere_check_cell(tree_B,vertices_A);
    i_btest = i_btest + i_1;
    
    if ~isempty(leaf_A)
        for i_A = 1:size(leaf_A,1)
            
            %%%%% BVTT2
            [leaf_B, i_2] = sphere_check_cell(tree_A,leaf_A{i_A});
            i_btest = i_btest + i_2;
            if ~isempty(leaf_B)
                for i_B = 1:size(leaf_B,1)
                    tic
                    
                    %%%% primitive tests
                    flag1 = primitive_test(leaf_A{i_A},leaf_B{i_B});
                    T_p = toc;
                    t_p = t_p + T_p;
                    i_ptest = i_ptest + 1;
                    
                    if flag1
                        flag = true;
                        
                        %%% plot leaf node
                        [c_1,r_1] = build_sphere(leaf_A{i_A});
                        [c_2,r_2] = build_sphere(leaf_B{i_B});
                        viscircles(c_1,r_1,'color','y');
                        viscircles(c_2,r_2,'color','y');
                        return;
                    end
                end
            end
        end
    end
end
end  