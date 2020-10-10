function [center, radius] = build_sphere(pointA, pointB)
center = (pointA+pointB)/2;
radius = norm(pointA- pointB)/2;
end