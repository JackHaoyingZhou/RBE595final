function [flag] = sphere_polygon_b(vertices_A,vertices_B,num_A,num_B)
flag = false;
vertices_A(end,:) = [];
vertices_B(end,:) = [];
c_A = (max(vertices_A)+min(vertices_A))/2;
r_A = norm(max(vertices_A)-min(vertices_A))/2;
c_B = (max(vertices_B)+min(vertices_B))/2;
r_B = norm(max(vertices_B)-min(vertices_B))/2;
c_1 = c_A;
c_2 = c_B;
r_1 = r_A;
r_2 = r_B;
v_1 = vertices_A;
v_2 = vertices_B;
v_3 = vertices_A;
v_4 = vertices_B;
num_iterA = ceil(log2(num_A));
num_iterB = ceil(log2(num_B));
num_iter = max(num_iterA,num_iterB);
ind_A = num_A;
ind_B = num_B;
i_iter = 1;

if sphere_collision(c_A,c_B,r_A,r_B)
    while i_iter > 0 && i_iter < num_iter 
        flag = false;
        ind_A = ceil(size(v_1,1)/2);
        ind_B = ceil(size(v_2,1)/2);
        v_A = v_1(1:1:ind_A,:);
        v_B = v_1(ind_A:1:end,:);
        v_C = v_2(1:1:ind_B,:);
        v_D = v_2(ind_B:1:end,:);
        if ind_A > 1 && ind_B > 1
            [c_ssphere1,r_ssphere1] = build_sphere_b(v_A);
            [c_ssphere2,r_ssphere2] = build_sphere_b(v_B);
            [c_ssphere3,r_ssphere3] = build_sphere_b(v_C);
            [c_ssphere4,r_ssphere4] = build_sphere_b(v_D);
        elseif ind_A == 1 && ind_B == 1
            c_ssphere1 = c_1;
            r_ssphere1 = r_1;
            c_ssphere2 = c_1;
            r_ssphere2 = r_1;
            c_ssphere3 = c_2;
            r_ssphere3 = r_2;
            c_ssphere4 = c_2;
            r_ssphere4 = r_2;
            v_A = v_1;
            v_B = v_1;
            v_C = v_2;
            v_D = v_2;
        elseif ind_A == 1
            c_ssphere1 = c_1;
            r_ssphere1 = r_1;
            c_ssphere2 = c_1;
            r_ssphere2 = r_1;
            [c_ssphere3,r_ssphere3] = build_sphere_b(v_C);
            [c_ssphere4,r_ssphere4] = build_sphere_b(v_D);
            v_A = v_1;
            v_B = v_1;
        elseif ind_B == 1
            [c_ssphere1,r_ssphere1] = build_sphere_b(v_A);
            [c_ssphere2,r_ssphere2] = build_sphere_b(v_B);
            c_ssphere3 = c_2;
            r_ssphere3 = r_2;
            c_ssphere4 = c_2;
            r_ssphere4 = r_2;
            v_C = v_2;
            v_D = v_2;
        else
            disp('error!')
        end
        
        
        
        if sphere_collision(c_ssphere1,c_ssphere3,r_ssphere1,r_ssphere3)
            v_1 = v_A;
            v_2 = v_C;
            v_3 = v_B;
            v_4 = v_D;
            flag = true;
            c_1 = c_ssphere1;
            r_1 = r_ssphere1;
            c_2 = c_ssphere3;
            r_2 = r_ssphere3;
            flag = true;
            i_iter = i_iter + 1;
        elseif sphere_collision(c_ssphere1,c_ssphere4,r_ssphere1,r_ssphere4)
            v_1 = v_A;
            v_2 = v_D;
            v_3 = v_B;
            v_4 = v_C;
            c_1 = c_ssphere1;
            r_1 = r_ssphere1;
            c_2 = c_ssphere4;
            r_2 = r_ssphere4;
            flag = true;
            i_iter = i_iter + 1;
        elseif sphere_collision(c_ssphere2,c_ssphere3,r_ssphere2,r_ssphere3)
            v_1 = v_B;
            v_2 = v_C;
            v_3 = v_A;
            v_4 = v_D;
            c_1 = c_ssphere2;
            r_1 = r_ssphere2;
            c_2 = c_ssphere3;
            r_2 = r_ssphere3;
            flag = true;
            i_iter = i_iter + 1;
        elseif sphere_collision(c_ssphere2,c_ssphere4,r_ssphere2,r_ssphere4)
            v_1 = v_B;
            v_2 = v_D;
            v_3 = v_A;
            v_4 = v_C;
            c_1 = c_ssphere2;
            r_1 = r_ssphere2;
            c_2 = c_ssphere4;
            r_2 = r_ssphere4;
            flag = true;
            i_iter = i_iter + 1;
        else
            v_1 = v_3;
            v_2 = v_4;
            i_iter = i_iter - 1;
        end
    end
end

if flag
    viscircles(c_1,r_1,'color','r');
    viscircles(c_2,r_2,'color','r');
end



end