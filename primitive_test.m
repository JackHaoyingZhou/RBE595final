function [flag] = primitive_test(vertices_A,vertices_B)
%%%% initialize
flag = false;
num_A = size(vertices_A,1) - 1;
num_B = size(vertices_B,1) - 1;
mod = py.importlib.import_module('linesegment_collision');


%%%% line segment collision detect
for i_treeB = 1:num_B
    point_1 = vertices_B(i_treeB,:);
    point_2 = vertices_B(i_treeB+1,:);
    vec_1 = [point_1;point_2];
    
    for i_treeA = 1:num_A
        point_3 = vertices_A(i_treeA,:);
        point_4 = vertices_A(i_treeA+1,:);
        vec_2 = [point_3;point_4];
        
        flag_pyres = mod.is_intersected(vec_1,vec_2);
        flag_intersect = logical(flag_pyres.data);
        
        if flag_intersect
            plot(vec_1(:,1),vec_1(:,2),'color','r','Linewidth',2);
            plot(vec_2(:,1),vec_2(:,2),'color','r','Linewidth',2);
            flag = true;
            return;
        end
    end
end


end