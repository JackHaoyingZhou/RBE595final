function [flag,i_test] = primitive_test(leaf_A,leaf_B,v_type)
flag = false;
i_test = 0;
for i = 1:size(leaf_A,1)
    for j = 1:size(leaf_B,1)
        switch v_type
            case 'line'
                [flag1,i_pt] = line_test(leaf_A{i},leaf_B{j});
            case 'AABB'
                num_A = size(leaf_A{i},1)-1;
                num_B = size(leaf_B{j},1)-1;
                [flag1,i_pt] = AABB_polygon(leaf_A{i},leaf_B{j},num_A,num_B);
            case 'OBB'
                num_A = size(leaf_A{i},1)-1;
                num_B = size(leaf_B{j},1)-1;
                [flag1,i_pt] = OBB_polygon(leaf_A{i},leaf_B{j},num_A,num_B);
            case 'Sphere'
                num_A = size(leaf_A{i},1)-1;
                num_B = size(leaf_B{j},1)-1;
                [flag1,i_pt] = sphere_polygon(leaf_A{i},leaf_B{j},num_A,num_B);
        end
% %         [flag1,i_pt] = line_test(leaf_A{i},leaf_B{j});
%         [flag1,i_pt] = AABB_polygon(leaf_A{i},leaf_B{j});
        i_test = i_test + i_pt;
        if flag1
            flag = true;
            return;
        end
    end
end

end