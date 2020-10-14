function [flag] = sphere_polygon_b(vertices_A,vertices_B,num_A,num_B)
flag = false;
vertices_A(end,:) = [];
vertices_B(end,:) = [];
[c_A,r_A] = build_sphere(vertices_A);
[c_B,r_B] = build_sphere(vertices_B);
c_1 = c_A;
c_2 = c_B;
r_1 = r_A;
r_2 = r_B;
v_1 = vertices_A;
v_2 = vertices_B;
num_iterA = ceil(log2(num_A));
num_iterB = ceil(log2(num_B));
num_iter = max(num_iterA,num_iterB);
ind_A = num_A;
ind_B = num_B;
v_3 = cell(1,2^num_iter);
v_4 = cell(1,2^num_iter);
v_3{1} = vertices_A;
v_4{1} = vertices_B;
i_iter = 1;

if sphere_collision(c_A,c_B,r_A,r_B)
    while i_iter > 0 && i_iter < 2^num_iter 
        flag = false;
        ind_A = ceil(size(v_1,1)/2);
        ind_B = ceil(size(v_2,1)/2);
        if ind_A > 1 && ind_B > 1
            if mod(size(v_1,1),2) == 0 && mod(size(v_2,1),2) == 0
                v_1 = [v_1;v_1(1,:)];
                v_2 = [v_2;v_2(1,:)];
            elseif mod(size(v_1,1),2) == 0
                v_1 = [v_1;v_1(1,:)];
            elseif mod(size(v_2,1),2) == 0
                v_2 = [v_2;v_2(1,:)];
            end
        elseif ind_A > 1 && ind_B == 1
            if mod(size(v_1,1),2) == 0
                v_1 = [v_1;v_1(1,:)];
            end
        elseif ind_B > 1 && ind_A == 1
            if mod(size(v_2,1),2) == 0
                v_2 = [v_2;v_2(1,:)];
            end
        end
        id_A = ceil(size(v_1,1)/2);
        id_B = ceil(size(v_2,1)/2);
%         if ind_A > 1 && ind_B > 1
%             if mod(size(v_1,1),2) == 0 && mod(size(v_2,1),2) == 0
%                 id_A = id_A + 1;
%                 id_B = id_B + 1;
%             elseif mod(size(v_1,1),2) == 0
%                 id_A = id_A + 1;
%             elseif mod(size(v_2,1),2) == 0
%                 id_B = id_B + 1;
%             end
%         elseif ind_A > 1 && ind_B == 1
%             if mod(size(v_1,1),2) == 0
%                 id_A = id_A + 1;
%             end
%         elseif ind_B > 1 && ind_A == 1
%             if mod(size(v_2,1),2) == 0
%                 id_B = id_B + 1;
%             end
%         end
%         elseif size(v_2,1) == 3 && isequal(v_2(1,:),v_2(end,:))
%             v_2(end,:) = [];
%         elseif size(v_1,1) == 3 && isequal(v_1(1,:),v_1(end,:))
%             v_1(end,:) = [];
        %end
%         id_A = ceil(size(v_1,1)/2);
%         id_B = ceil(size(v_2,1)/2);
        v_A = v_1(1:1:id_A,:);
        v_B = v_1(id_A:1:end,:);
        v_C = v_2(1:1:id_B,:);
        v_D = v_2(id_B:1:end,:);
        if ind_A == 1 && ind_B == 1
            %v_1(end,:) = [];
            %v_2(end,:) = [];
            v_A = v_1;
            v_B = v_1;
            v_C = v_2;
            v_D = v_2;
        elseif ind_A == 1
            %v_1(end,:) = [];
            v_A = v_1;
            v_B = v_1;
        elseif ind_B == 1
            %v_2(end,:) = [];
            v_C = v_2;
            v_D = v_2;
%         else
%             if mod(size(v_1,1),2) == 0 && mod(size(v_2,1),2) == 0
%                 v_B(1,:) = [];
%                 v_D(1,:)= [];
%             elseif mod(size(v_1,1),2) == 0
%                 v_B(1,:) = [];
%             elseif mod(size(v_2,1),2) == 0
%                 v_D(1,:)= [];
%             end
        end
        
        [c_ssphere1,r_ssphere1] = build_sphere(v_A);
        [c_ssphere2,r_ssphere2] = build_sphere(v_B);
        [c_ssphere3,r_ssphere3] = build_sphere(v_C);
        [c_ssphere4,r_ssphere4] = build_sphere(v_D);
        
        if sphere_collision(c_ssphere1,c_ssphere3,r_ssphere1,r_ssphere3)
            i_iter = i_iter + 1;
            v_1 = v_A;
            v_2 = v_C;
            v_3{i_iter} = v_B;
            v_4{i_iter} = v_D;
            flag = true;
            c_1 = c_ssphere1;
            r_1 = r_ssphere1;
            c_2 = c_ssphere3;
            r_2 = r_ssphere3;
            flag = true;
        elseif sphere_collision(c_ssphere1,c_ssphere4,r_ssphere1,r_ssphere4)
            i_iter = i_iter + 1;
            v_1 = v_A;
            v_2 = v_D;
            v_3{i_iter} = v_B;
            v_4{i_iter} = v_C;
            c_1 = c_ssphere1;
            r_1 = r_ssphere1;
            c_2 = c_ssphere4;
            r_2 = r_ssphere4;
            flag = true;
        elseif sphere_collision(c_ssphere2,c_ssphere3,r_ssphere2,r_ssphere3)
            i_iter = i_iter + 1;
            v_1 = v_B;
            v_2 = v_C;
            v_3{i_iter} = v_A;
            v_4{i_iter} = v_D;
            c_1 = c_ssphere2;
            r_1 = r_ssphere2;
            c_2 = c_ssphere3;
            r_2 = r_ssphere3;
            flag = true;
        elseif sphere_collision(c_ssphere2,c_ssphere4,r_ssphere2,r_ssphere4)
            i_iter = i_iter + 1;
            v_1 = v_B;
            v_2 = v_D;
            v_3{i_iter} = v_A;
            v_4{i_iter} = v_C;
            c_1 = c_ssphere2;
            r_1 = r_ssphere2;
            c_2 = c_ssphere4;
            r_2 = r_ssphere4;
            flag = true;
        else
            v_1 = v_3{i_iter};
            v_2 = v_4{i_iter};
            i_iter = i_iter - 1;
        end
    end
end

if flag
    viscircles(c_1,r_1,'color','r');
    viscircles(c_2,r_2,'color','r');
end



end 