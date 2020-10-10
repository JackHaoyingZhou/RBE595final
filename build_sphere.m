function [center, radius] = build_sphere(pointA, pointB)
if isequal(pointA,pointB)
    disp('error!')
end
center = (pointA+pointB)/2;
radius = norm(pointA- pointB)/2;
end