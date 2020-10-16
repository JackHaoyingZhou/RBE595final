function [flag] = OBB_collision_p(vertices_1,vertices_2)
if isempty(vertices_1) || isempty(vertices_2)
    flag = false;
    return;
else
    [rec_1,rec_plot1] = build_OBB(vertices_1);
    [rec_2,rec_plot2] = build_OBB(vertices_2);
    flag = AABB_collision(rec_1,rec_2);
    
    %%%%%% plot
    plot(rec_plot1(:,1),rec_plot1(:,2),'color','g','Linewidth',2);
    plot(rec_plot2(:,1),rec_plot2(:,2),'color','g','Linewidth',2);
end
end