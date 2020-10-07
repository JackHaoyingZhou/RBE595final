function [flag] = sphere_collision(center_A,center_B,rA,rB)
diff_c = center_B - center_A;
T_length = norm(diff_c);
if (rA + rB) < T_length
    flag = false;
else
    flag = true;
end

end