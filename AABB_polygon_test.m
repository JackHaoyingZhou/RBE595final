function [flag, i_test] = AABB_polygon_test(vertices_A,vertices_B,num_A,num_B)
[rec_A_total,~] = build_AABB(vertices_A);
[rec_B_total,~] = build_AABB(vertices_B);
flag = false;
i_test = 0;

if AABB_collision(rec_A_total,rec_B_total)
    for i_treeB = 1:num_B
        point_1 = vertices_B(i_treeB,:);
        point_2 = vertices_B(i_treeB+1,:);
        [rec_1,rec_plot1] = build_AABB([point_1;point_2]);
        if AABB_collision(rec_A_total,rec_1)
            for i_treeA = 1:num_A
                point_3 = vertices_A(i_treeA,:);
                point_4 = vertices_A(i_treeA+1,:);
                [rec_2,rec_plot2] = build_AABB([point_3;point_4]);
                %tic 
                %flag1 = sphere_collision(c_ssphere1,c_ssphere2,r_ssphere1,r_ssphere2);
                %toc
                if AABB_collision(rec_1,rec_2)
                    plot(rec_plot1(:,1),rec_plot1(:,2),'color','r','Linewidth',2);
                    plot(rec_plot2(:,1),rec_plot2(:,2),'color','r','Linewidth',2);
                    %disp('collision!');
                    %disp(AABB_collision(rec_1,rec_2));
                    flag = true;
                    i_test = i_test + 1;
                    %return;
                end
            end
        end
    end
end


end