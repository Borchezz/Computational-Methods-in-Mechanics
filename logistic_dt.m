function logistic_dt()
f = @(u,t) 0.1*(1-u/500)*u;
U_0 = 100;

dt = 20; T = 100;

[u_prev, t_prev] = ode_FE(f, U_0, dt, T);

k = 1;

repeat = true;

while repeat == true
    dt_k = 2^(-k) * dt;
    [u_curr, t_curr] = ode_FE(f, U_0, dt_k, T);
    plot(t_prev, u_prev, 'g-', t_curr, u_curr, 'm--')
    xlabel('t'); ylabel('N(t)'); 
    fprintf('Current time step - %g\n', dt_k);
    answer = input('Repeat and increase accuracy (y/n)? ', 's')
    if strcmp(answer,'y')
        u_prev = u_curr;
        t_prev = t_curr;
    else
        repeat = false;
    end
    k =k+1;
end
end