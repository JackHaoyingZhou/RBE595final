function [cell_2, i_btest]=sphere_check_cell(cell_1,vertices_1)
%%%% initialize
cell_2 = cell(0,1);
i_btest = 0;

%%%%%%BV test
for i_1 = 1:size(cell_1,2)-1
    for j_1 = 1:2^(i_1-1)
        flag1 = sphere_collision_p(cell_1{2*j_1 - 1,i_1},vertices_1);
        flag2 = sphere_collision_p(cell_1{2*j_1,i_1},vertices_1);
        i_btest = i_btest + 1;
        if flag1 && flag2
        elseif flag1
            cell_1{2*j_1,i_1} = [];
        elseif flag2
            cell_1{2*j_1 - 1,i_1} = [];
        else
            cell_1{2*j_1 - 1,i_1} = [];
            cell_1{2*j_1,i_1} = [];
            break;
        end
    end
end

%%%%% get the leaf node elements
for i_1 = 1:size(cell_1,2)
    for j_1 = 1:2^(i_1-2)
        if isempty(cell_1{j_1,i_1-1})
            cell_1{2*j_1-1, i_1} = [];
            cell_1{2*j_1, i_1} = [];
        end
    end
end

i_iter = 1;
for i_2 = 1:size(cell_1,1)
    if ~isempty(cell_1{i_2,end})
        cell_2{i_iter,1} = cell_1{i_2,end};
        i_iter = i_iter + 1;
        %continue;
    end
end


end