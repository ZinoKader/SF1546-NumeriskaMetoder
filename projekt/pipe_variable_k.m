
function [T_values, r_values] = pipe_variable_k(n, added_thickness)

    inner_r = 1;
    outer_r = 2 + added_thickness;
    k_0 = 50;
    k_1 = 3;
    delta = 1/50;
    a = 15;
    Te = 20;
    Ti = 350;
    h = (outer_r - inner_r) / n;
    
    d = @(r) (1/2) + (1/pi) * atan(r/delta);
    k = @(r) k_0 + (k_1 - k_0) * d(r-2);
    k_prim = @(r) delta * (k_1 - k_0) / (pi * (delta^2 + (r-2)^2));
    K = @(r) 1 + r * (k_prim(r) / k(r));
    standard_row = @(r) [r - ((h/2) * K(r)), -2*r, r + ((h/2) * K(r))];
    
    r_values = [inner_r];
    inner_r = inner_r + h;
    first_row = zeros(1, n);
    last_row = zeros(1, n);
    first_row(1, [1,2]) = [-2*inner_r, inner_r + ((h/2) * K(inner_r))];
    last_row(1, [n-2, n-1, n]) = [1, -4, 3 + ((2*a*h)/k(outer_r))];
    middle_rows = zeros(n-2,n);
    
    offset = 0;
    row_count = 1;
    for r = inner_r + h : h : outer_r - h
        middle_rows(row_count, [1+offset, 2+offset, 3+offset]) = standard_row(r);
        r_values = [r_values, r];
        row_count = row_count + 1;
        offset = offset + 1;
    end
    A = [first_row; middle_rows; last_row];
    b = zeros(n-2, 1);
    b = [-Ti*(inner_r - ((h/2) * K(inner_r))); b; (2*a*h*Te)/k(outer_r)];
    
    A = sparse(A);
    T_values = A \ b;
    r_values = [r_values, outer_r]';
end

