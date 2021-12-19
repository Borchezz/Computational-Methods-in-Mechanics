function linear_interpolation()
    N = 4;
    delta_t = 1;
    y = zeros(5,1);
    y(1) = 4.4; 
    y(2) = 2.0; 
    y(3) = 11.0; 
    y(4) = 21.5; 
    y(5) = 7.5;

    find_y(y,N,delta_t);
end

function result = interpolate(y, t, delta_t)
    % Uses linear interpolation to find intermediate y
    i = floor(t) + 1;
    % Scheme: y(t) = y_i + delta-y/delta-t * dt
    result = y(i) + ((y(i+1) - y(i))/delta_t)*(t-floor(t));
end
    
function find_y(y, N, delta_t)
    fprintf('For time t on the interval [0,%d]... \n', N);
    t = input('Give your desired t: ');
    while t >= 0
        fprintf('y(t) = %g \n', interpolate(y, t, delta_t));
        t = input('Give new time t: ');
    end
end