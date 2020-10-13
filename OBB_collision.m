function [flag] = OBB_collision(rec_A,rec_B)
flag = true;

axis_n = [rec_A(2,:)-rec_A(1,:);rec_A(3,:)-rec_A(2,:);rec_B(2,:)-rec_B(1,:);rec_B(3,:)-rec_B(2,:)];
for i_iter = 1:size(axis_n,1)
    norm_vec = null(axis_n(i_iter,:));
    center_A  = sum(rec_A)/4;
    center_B = sum(rec_B)/4;
    
    center_A_x = (rec_A(2,:)+rec_A(1,:))/2;
    center_A_y = (rec_A(2,:)+rec_A(3,:))/2;
    center_B_x = (rec_B(2,:)+rec_B(1,:))/2;
    center_B_y = (rec_B(2,:)+rec_B(3,:))/2;
    
    vector_A_x = center_A - center_A_x;
    vector_A_y = center_A - center_A_y;
    vector_B_x = center_B - center_B_x;
    vector_B_y = center_B - center_B_y;
    vector_C = center_B - center_A;
    L_t = abs(vector_C*norm_vec);
    L_A_x = abs(vector_A_x*norm_vec);
    L_A_y = abs(vector_A_y*norm_vec);
    L_B_x = abs(vector_B_x*norm_vec);
    L_B_y = abs(vector_B_y*norm_vec);
    if L_A_x + L_A_y + L_B_x + L_B_y < L_t
        flag = false;
        return;
    end
end

end