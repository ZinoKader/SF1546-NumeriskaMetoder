
clc
close all
figure()

% eiffel1 ingen LU
load("eiffel1.mat")
n = 261;
b = zeros(2*n, 1);
x_dislocations = zeros(n, 1);
tic
for i = 1:size(b)
    if mod(i, 2) == 0
        node_index = i / 2;
        b(i) = -1;
        x = A\b;
        x_sum = 0;
        for d = 1:2:size(x)
            x_delta = x(d);
            y_delta = x(d + 1);
            x_sum = ((x_delta^2) + (y_delta^2));
        end
        x_abs = sqrt(x_sum);
        x_dislocations(node_index) = x_abs;
    end    
    b = zeros(2*n, 1);
end    
eiffel1_no_lu = toc;
% end eiffel1 ingen LU

% ---

% eiffel1 med LU
load("eiffel1.mat")
n = 261;
b = zeros(2*n, 1);
x_dislocations = zeros(n, 1);
tic
[L, U] = lu(A);
for i = 1:size(b)
    if mod(i, 2) == 0
        node_index = i / 2;
        b(i) = -1;
        d = L\b;
        x = U\d;
        x_sum = 0;
        for d = 1:2:size(x)
            x_delta = x(d);
            y_delta = x(d + 1);
            x_sum = ((x_delta^2) + (y_delta^2));
        end
        x_abs = sqrt(x_sum);
        x_dislocations(node_index) = x_abs;
    end    
    b = zeros(2*n, 1);
end    
eiffel1_with_lu = toc;
% end eiffel1 med LU

% eiffel1 ingen LU sparse
load("eiffel1.mat")
n = 261;
b = zeros(2*n, 1);
x_dislocations = zeros(n, 1);
A = sparse(A);
tic
for i = 1:size(b)
    if mod(i, 2) == 0
        node_index = i / 2;
        b(i) = -1;
        x = A\b;
        x_sum = 0;
        for d = 1:2:size(x)
            x_delta = x(d);
            y_delta = x(d + 1);
            x_sum = ((x_delta^2) + (y_delta^2));
        end
        x_abs = sqrt(x_sum);
        x_dislocations(node_index) = x_abs;
    end    
    b = zeros(2*n, 1);
end    
eiffel1_no_lu_sparse = toc;
% end eiffel1 ingen LU sparse

% ---

% eiffel1 med LU sparse
load("eiffel1.mat")
n = 261;
b = zeros(2*n, 1);
x_dislocations = zeros(n, 1);
A = sparse(A);
tic
[L, U] = lu(A);
for i = 1:size(b)
    if mod(i, 2) == 0
        node_index = i / 2;
        b(i) = -1;
        d = L\b;
        x = U\d;
        x_sum = 0;
        for d = 1:2:size(x)
            x_delta = x(d);
            y_delta = x(d + 1);
            x_sum = ((x_delta^2) + (y_delta^2));
        end
        x_abs = sqrt(x_sum);
        x_dislocations(node_index) = x_abs;
    end    
    b = zeros(2*n, 1);
end    
eiffel1_with_lu_sparse = toc;
% end eiffel1 med LU sparse



