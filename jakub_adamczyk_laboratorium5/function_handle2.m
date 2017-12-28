%Jakub Adamczyk

function result = function_handle2( t, x )
%FUNCTION_HANDLE2 Summary of this function goes here
%   Detailed explanation goes here
    result = zeros(size(x));
    result(1) = -x(1);
    result(2) = -x(2)^2;
end

