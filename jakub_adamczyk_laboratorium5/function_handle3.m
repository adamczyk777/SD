%Jakub Adamczyk

function result = function_handle3( t, x )
%FUNCTION_HANDLE3 Summary of this function goes here
%   Detailed explanation goes here
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = -2 * x(1) - 3 * x(1)^2 - x(2);
end

