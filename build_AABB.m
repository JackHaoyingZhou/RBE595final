function [rec,rec_plot] = build_AABB(vertices)
tol = 1e-9;
rec = zeros(4,2);
rec_plot = zeros(5,2);
rec_max = max(vertices);
rec_min = min(vertices);
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