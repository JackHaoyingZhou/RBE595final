function [rec,rec_plot] = build_OBB(pointA, pointB)
if isequal(pointA,pointB)
    disp('error!')
    disp(pointA)
    disp(pointB)
end
rec = zeros(4,2);
rec_plot = zeros(5,2);
point_matrix = [];
    
if size(pointA,1) == 1 && size(pointB,1) == 1
    vector_AB = pointB - pointA;
    
    normal_vector = (null(vector_AB))';
    
    rec_A = pointA + 0.01*normal_vector;
    rec_B = pointA - 0.01*normal_vector;
    rec_C = pointB + 0.01*normal_vector;
    rec_D = pointB - 0.01*normal_vector;
    
    rec = [rec_A;rec_B;rec_D;rec_C];
    
    rec_plot = [rec;rec(1,:)];
else
    point_matrix = [pointA;pointB];
    
    x_t = point_matrix(:,1);
    y_t = point_matrix(:,2);
    cov_mtx = cov(x_t,y_t);
    [V,~] = eig(cov_mtx);
    pointA = (V*(pointA'))';
    pointB = (V*(pointB'))';
    [rec,rec_plot] = build_AABB(pointA,pointB);
    rec = (V*(rec)')';
    rec_plot = (V*(rec_plot)')';
end

end