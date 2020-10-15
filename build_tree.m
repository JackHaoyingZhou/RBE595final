function [tree_struct] = build_tree(vertices)
num_v = size(vertices,1);
no_iter = ceil(log2(num_v)) - 2;
tree_struct = cell(2^no_iter,no_iter+1);
tree_struct{1,1} = vertices;
idx_v = num_v;
i_iter = 1;

while i_iter <= no_iter
    i_iter = i_iter + 1;
    for i = 1:(i_iter-1)
        for j = 1:2^(i_iter-1)
            if ~isempty(tree_struct{j, i})
                idx_v = ceil(size(tree_struct{j, i_iter-1},1)/2);
                tree_struct{2*j-1, i_iter} = tree_struct{j, i_iter-1}(1:1:idx_v,:);
                tree_struct{2*j, i_iter} = tree_struct{j, i_iter-1}(idx_v:1:end,:);
            else
                continue;
            end
        end
    end
end





end