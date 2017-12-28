function result = vanderpol( x, eps )
%VANDERPOL Summary of this function goes here
%   Detailed explanation goes here

    A = [0, 1;-1, 0];
    result = A * x + [0; eps*x(2)*(1-x(1)*x(1))];

end

