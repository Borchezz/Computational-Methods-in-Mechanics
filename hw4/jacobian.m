function P = jacobian(u, b)
theta = u(1);
P = [- b * sin(theta), -1
    - b * cos(theta), 0];
end