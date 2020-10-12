function [flag] = AABB_collision(rec_A,rec_B)
flag = true;
unit_x = [1;0];
unit_y = [0;1];

center_A  = sum(rec_A)/4;
center_B = sum(rec_B)/4;

vector_A = center_A - rec_A(1,:);
vector_B = center_B - rec_B(1,:);
vector_C = center_B - center_A;

L_t_x = abs(vector_C*unit_x);
L_t_y = abs(vector_C*unit_y);
L_A_x = abs(vector_A*unit_x);
L_A_y = abs(vector_A*unit_y);
L_B_x = abs(vector_B*unit_x);
L_B_y = abs(vector_B*unit_y);

if (L_A_x + L_B_x < L_t_x) || (L_A_y + L_B_y < L_t_y)
    flag = false;
end

end