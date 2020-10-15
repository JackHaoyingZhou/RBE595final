function [flag] = sphere_collision_p(vertices_1,vertices_2)
if isempty(vertices_1) || isempty(vertices_2)
    flag = false;
    return;
else
    [c_1,r_1] = build_sphere(vertices_1);
    [c_2,r_2] = build_sphere(vertices_2);
    flag = sphere_collision(c_1,c_2,r_1,r_2);
%     c_1
%     c_2
%     r_1
%     r_2
    
    %%%%%% plot
    viscircles(c_1,r_1,'color','g');
    viscircles(c_2,r_2,'color','g');
end
end