function [center, radius] = build_sphere(vertices)
center = (max(vertices)+min(vertices))/2;
num_v = size(vertices,1);
distance_v = vertices - center;
r_list = zeros(num_v,1);
for i = 1:num_v
    r_list(i) = norm(distance_v(i,:));
end
radius = max(r_list);
    

% if size(vertices,1) == 2
%     pointA = vertices(1,:);
%     pointB = vertices(2,:);
%     center = (pointA+pointB)/2;
%     radius = norm(pointA- pointB)/2;
% else
%     center = (max(vertices)+min(vertices))/2;
%     radius = norm(max(vertices)-min(vertices))/2;
% end
end