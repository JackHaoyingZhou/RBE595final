%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.
function polygon_plot(vertices,style)
%tic
c_num=size(vertices,2);%memory allocation to store the row number and column number of input vertices.
destVertices=zeros(size(vertices));%memory allocation to store subsequent vertices.

destVertices(:,c_num)=vertices(:,1);%assign the first column vector of vertices to the last column of tempVM.
destVertices(:,1:c_num-1)=vertices(:,2:c_num);%assign the values from the 2nd column to the last column of vertices
                                        %to the values from the first
                                        %column to the second last column of tempVM .
distVec=destVertices-vertices;%calculate the displacement vectors.

figure
quiver(vertices(1,:),vertices(2,:),distVec(1,:),distVec(2,:),0,style);%plot the polygon with indicating output direction.

% if polygon_isFilled(vertices)
%     patch(vertices(1,:),vertices(2,:),[.6 .6 .6]);
% else
%     set(gca,'color',[.6 .6 .6]);
%     patch(vertices(1,:),vertices(2,:),[1 1 1])
% end

set(gca,'xtick',[]);
set(gca,'ytick',[]);
hold off;

%toc


%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.
