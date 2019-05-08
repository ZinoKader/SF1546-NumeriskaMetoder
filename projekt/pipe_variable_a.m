
function [T_value] = pipe_variable_a(n, a)

    inner_r = 1;
    outer_r = 2;
    k = 50;
    Te = 20;
    Ti = 350;
    h = (outer_r - inner_r) / n;
    standard_row = @(r) [r-(h/2), -2*r, r+(h/2)];
    
    inner_r = inner_r + h;
    first_row = zeros(1, n);
    last_row = zeros(1, n);
    first_row(1, [1,2]) = [-2*inner_r, inner_r + (h/2)];
    last_row(1, [n-2, n-1, n]) = [1, -4, 3 + (2*a*h)/k];
    middle_rows = zeros(n-2,n);
    
    offset = 0;
    row_count = 1;
    for r = inner_r + h : h : outer_r - h
        middle_rows(row_count, [1+offset, 2+offset, 3+offset]) = standard_row(r);
        row_count = row_count + 1;
        offset = offset + 1;
    end
    A = [first_row; middle_rows; last_row];
    b = zeros(n-2, 1);
    b = [-Ti*(inner_r - (h/2)); b; (2*a*h*Te)/k];
    
    A = sparse(A);
    T_values = A \ b;
    T_value = T_values(end);
end

