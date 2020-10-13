function [center, radius] = build_sphere(pointA, pointB)
if isequal(pointA,pointB)
    disp('error!')
end

if size(pointA,1) == 1 && size(pointB,1) == 1
    center = (pointA+pointB)/2;
    radius = norm(pointA- pointB)/2;
else
    point_mtx = [pointA;pointB];
    center = (max(point_mtx)+min(point_mtx))/2;
    radius = norm(max(point_mtx)-min(point_mtx))/2;
end
end