function [flag] = sphere_polygon(vertices_A,vertices_B,num_A,num_B)
[c_A,r_A] = build_sphere(vertices_A);
[c_B,r_B] = build_sphere(vertices_B);
flag = false;

if sphere_collision(c_A,c_B,r_A,r_B)
    for i_treeB = 1:num_B
        point_1 = vertices_B(i_treeB,:);
        point_2 = vertices_B(i_treeB+1,:);
        [c_ssphere1,r_ssphere1] = build_sphere([point_1;point_2]);
        if sphere_collision(c_A,c_ssphere1,r_A,r_ssphere1)
            for i_treeA = 1:num_A
                point_3 = vertices_A(i_treeA,:);
                point_4 = vertices_A(i_treeA+1,:);
                [c_ssphere2,r_ssphere2] = build_sphere([point_3;point_4]);
                %tic 
                %flag1 = sphere_collision(c_ssphere1,c_ssphere2,r_ssphere1,r_ssphere2);
                %toc
                if sphere_collision(c_ssphere1,c_ssphere2,r_ssphere1,r_ssphere2)
                    viscircles(c_ssphere1,r_ssphere1,'color','r');
                    viscircles(c_ssphere2,r_ssphere2,'color','r');
                    %disp('collision!');
                    %disp(sphere_collision(c_ssphere1,c_ssphere2,r_ssphere1,r_ssphere2));
                    flag = true;
                    
                    %return;
                end
            end
        end
    end
end


end