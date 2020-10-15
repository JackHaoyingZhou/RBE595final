function [flag] = AABB_polygon_b(vertices_A,vertices_B,num_A,num_B)
flag = false;
vertices_A(end,:) = [];
vertices_B(end,:) = [];
[rec_A,~] = build_AABB(vertices_A);
[rec_B,~] = build_AABB(vertices_B);
rec_1 = rec_A;
rec_2 = rec_B;
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

if AABB_collision(rec_A,rec_B)
    plot(rec_A(:,1),rec_A(:,2),'color','g','Linewidth',2);
    plot(rec_B(:,1),rec_B(:,2),'color','g','Linewidth',2);
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
        
        [rec_ss1,rec_1ssplot] = build_AABB(v_A);
        [rec_ss2,rec_2ssplot] = build_AABB(v_B);
        [rec_ss3,rec_3ssplot] = build_AABB(v_C);
        [rec_ss4,rec_4ssplot] = build_AABB(v_D);
        
        if AABB_collision(rec_ss1,rec_ss3)
            i_iter = i_iter + 1;
            v_1 = v_A;
            v_2 = v_C;
            v_3{i_iter} = v_B;
            v_4{i_iter} = v_D;
            flag = true;
            rec_1 = rec_1ssplot;
            rec_2 = rec_3ssplot;
            flag = true;
        elseif AABB_collision(rec_ss1,rec_ss4)
            i_iter = i_iter + 1;
            v_1 = v_A;
            v_2 = v_D;
            v_3{i_iter} = v_B;
            v_4{i_iter} = v_C;
            rec_1 = rec_1ssplot;
            rec_2 = rec_4ssplot;
            flag = true;
        elseif AABB_collision(rec_ss2,rec_ss3)
            i_iter = i_iter + 1;
            v_1 = v_B;
            v_2 = v_C;
            v_3{i_iter} = v_A;
            v_4{i_iter} = v_D;
            rec_1 = rec_2ssplot;
            rec_2 = rec_3ssplot;
            flag = true;
        elseif AABB_collision(rec_ss2,rec_ss4)
            i_iter = i_iter + 1;
            v_1 = v_B;
            v_2 = v_D;
            v_3{i_iter} = v_A;
            v_4{i_iter} = v_C;
            rec_1 = rec_2ssplot;
            rec_2 = rec_4ssplot;
            flag = true;
        else
            v_1 = v_3{i_iter};
            v_2 = v_4{i_iter};
            i_iter = i_iter - 1;
        end
        plot(rec_1(:,1),rec_1(:,2),'color','g','Linewidth',2);
        plot(rec_2(:,1),rec_2(:,2),'color','g','Linewidth',2);
    end
end

if flag
    plot(rec_1(:,1),rec_1(:,2),'color','r','Linewidth',2);
    plot(rec_2(:,1),rec_2(:,2),'color','r','Linewidth',2);
end
end