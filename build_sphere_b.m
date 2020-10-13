function [center, radius] = build_sphere_b(vertices)
if size(vertices,1) == 2
    pointA = vertices(1,:);
    pointB = vertices(2,:);
    center = (pointA+pointB)/2;
    radius = norm(pointA- pointB)/2;
else
    center = (max(vertices)+min(vertices))/2;
    radius = norm(max(vertices)-min(vertices))/2;
end
end