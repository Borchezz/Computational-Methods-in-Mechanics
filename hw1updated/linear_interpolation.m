%Exercise 2.15: Linear interpolation

function linear_interpolation()
format short 
yfind()

end

function interpl = interpolation(y, t) 
i = floor(t)+1; 
delta_t = 1; %step between times t
interpl = y(i) + ((y(i + 1) - y(i))/delta_t)*(t-floor(t));
end

function yfind() %for task b and c, finds y at t by interpolation
t = input('Please enter time value (t>0): '); 

y = zeros(1,5);%values from task c
y(1) = 4.4;
y(2) = 2.0;
y(3) = 11.0;
y(4) = 21.5;
y(5) = 7.5;

while t >= 0 %The loop is terminated when the user gives a negative time
    interpolation(y, t)
    t = input('Please enter NEW time value (t>0): ');
end
end
