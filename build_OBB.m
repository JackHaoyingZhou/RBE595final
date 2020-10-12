function [rec,rec_plot] = build_OBB(pointA, pointB)
tol = 1e-9;
if norm(pointA - pointB) < tol
    disp('error!')
end
rec = zeros(4,2);
rec_plot = zeros(5,2);
point_matrix = [pointA;pointB];
rec_max = max(point_matrix);
rec_min = min(point_matrix);
if abs(rec_max(1) - rec_min(1)) < tol
    rec_max(1) = rec_max(1) + 0.01;
    rec_min(1) = rec_min(1) - 0.01;
end
if abs(rec_max(2) - rec_min(2)) < tol
    rec_max(2) = rec_max(2) + 0.01;
    rec_min(2) = rec_min(2) - 0.01;
end

rec(1,:) = [rec_min(1),rec_max(2)];
rec(2,:) = rec_max;
rec(3,:) = [rec_max(1),rec_min(2)];
rec(4,:) = rec_min;
rec_plot = [rec;rec(1,:)];
end