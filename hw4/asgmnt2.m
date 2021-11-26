function asgmnt2()
a = 0.1; %meters
b = 0.2; %meters
omega = 1; %rad/sec
ts = 101;%time steps
%u = [theta; d];

theta_array = zeros(ts, 1);
x_array = zeros(ts, 1);
theta_der_array = zeros(ts, 1);
x_der_array = zeros(ts, 1);

u0 = [pi ; 0];
i = 1;
u = u0;
for t = linspace(0, 1, ts)
phi = pi / 6 + omega * t;%from the task

F = @(u) constraint(u, a, b, phi);
J = @(u) jacobian(u, b);
eps = 1e-9;
[u, ~] = NR_method(F, J, u, eps); 

df_dt = [- a * omega * sin(omega * t)
        a * omega * cos(omega * t)];
df_dq = [- b * sin(u(1)), -1
        - b * cos(u(1)), 0];
u_der = - df_dt \ df_dq;
theta_array(i) = u(1);
x_array(i) = u(2);
theta_der_array(i) = u_der(1);
x_der_array(i) = u_der(2);
i = i + 1;
end

t = linspace(0, 1, ts);

figure()
plot(t, theta_array, 'm-');
title('Theta');

figure()
plot(t, x_array, 'm-');
title('X');

figure()
plot(t, theta_der_array, 'm-');
title('Theta derivative');

figure()
plot(t, x_der_array, 'm-');
title('X derivative');
end