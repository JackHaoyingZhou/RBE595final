function [rec,rec_plot] = build_OBB(vertices)
rec = zeros(4,2);
rec_plot = zeros(5,2);
    

if size(vertices,1) == 2
    pointA = vertices(1,:);
    pointB = vertices(2,:);
    vector_AB = pointB - pointA;
    normal_vector = (null(vector_AB))';
    rec_A = pointA + 0.01*normal_vector;
    rec_B = pointA - 0.01*normal_vector;
    rec_C = pointB + 0.01*normal_vector;
    rec_D = pointB - 0.01*normal_vector;
    rec = [rec_A;rec_B;rec_D;rec_C];
    rec_plot = [rec;rec(1,:)];
else
    x_t = vertices(:,1);
    y_t = vertices(:,2);
    cov_mtx = cov(x_t,y_t);
    [V,D] = eig(cov_mtx);
    vertices = (V*(vertices'))';
    [rec_1,rec_plot_1] = build_AABB(vertices);
    rec = (V\(rec_1)')';
    rec_plot = (V\(rec_plot_1)')';
end

end