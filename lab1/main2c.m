
clc
close all
figure()


load("eiffel1.mat")

n = 261;
b = zeros(2*n, 1);
x_dislocations = zeros(n, 1);
for i = 1:size(b)
    % i b är element med udda index F i x-led, och jämna F i y-led
    % vi vill belasta i y-led, så vi ändrar element m. jämnt index
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
    b = zeros(2*n, 1); % återställ b för nästa provförskjutning
end    
[max_dislocation, max_index] = max(x_dislocations);
[min_dislocation, min_index] = min(x_dislocations);


max_y_node = ynod(max_index);
max_x_node = xnod(max_index);

min_y_node = ynod(min_index);
min_x_node = xnod(min_index);

trussplot(xnod, ynod, bars)
hold on
plot(max_x_node, max_y_node, "ro")
plot(min_x_node, min_y_node, "r*")