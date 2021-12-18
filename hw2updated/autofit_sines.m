function autofit_sines()
    f = @(t) (1/pi)*t;
    N = 3;
    M = 100;
    b = integrate_coeffs(f, N, M)
    for N = [3 6 12 24] %g
       plot_approx(f, N, M);
    end
    %h, when N=100
    g = @(t) exp(-(t-pi));
    plot_approx(g, 100, M);
end

function b_coeffs = integrate_coeffs(f, N, M)
    b = zeros(N,1);
    left_end = -pi; right_end = pi;
    for n = 1:N
        f_sin = @(t) f(t)*sin(n*t);     
        b(n) = (1/pi)*trapezoidal(f_sin, left_end, right_end, M);
    end
    b_coeffs = b;
end
    
function test_integrate_coeffs()
    f = @() 1;
    tol = 1E-14;
    N = 10;  M = 100;
    b = integrate_coeffs(f, N, M);
    b
    for i = 1:N
        err = abs(b(i))
        assert(err < tol, 'n = %d, err = %g', n, err);
    end
end

function plot_approx(f, N, M)
    function result = S_N(b,t)
        sum = 0;
        for i = 1:N
            sum = sum + b(i)*sin((i)*t);
        end
        result = sum;
    end        
    left_end = -pi;  right_end = pi;
    t = linspace(-pi,pi,100);
    y = f(t);
    b = integrate_coeffs(f, N, M);
    y_approx = S_N(b,t);
    h = figure;    plot(t,y,'g-',t,y_approx,'m--');
    xlabel('t');
    legend('f','S');
end