function [flag,i_test]=line_test(vertices_A,vertices_B)
flag = false;
num_A = size(vertices_A,1) - 1;
num_B = size(vertices_B,1) - 1;
mod = py.importlib.import_module('linesegment_collision');
i_test = 0;

for i_treeB = 1:num_B
    point_1 = vertices_B(i_treeB,:);
    point_2 = vertices_B(i_treeB+1,:);
    vec_1 = [point_1;point_2];
    for i_treeA = 1:num_A
        point_3 = vertices_A(i_treeA,:);
        point_4 = vertices_A(i_treeA+1,:);
        vec_2 = [point_3;point_4];
        %tic
        flag_pyres = mod.is_intersected(vec_1,vec_2);
        flag_intersect = logical(flag_pyres.data);
        %toc
        
        i_test = i_test + 1;
        
        if flag_intersect
            plot(vec_1(:,1),vec_1(:,2),'color','r','Linewidth',2);
            plot(vec_2(:,1),vec_2(:,2),'color','r','Linewidth',2);
            %disp('collision!');
            %disp(flag_intersect);
            flag = true;
            return;
        end
    end
end

end