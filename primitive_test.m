function [flag,i_test] = primitive_test(leaf_A,leaf_B)
flag = false;
i_test = 0;
for i = 1:size(leaf_A,1)
    for j = 1:size(leaf_B,1)
        [flag1,i_pt] = line_test(leaf_A{i},leaf_B{j});
        i_test = i_test + i_pt;
        if flag1
            flag = true;
            return;
        end
    end
end

end