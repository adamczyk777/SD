%Jakub Adamczyk

function result = function_handle6( t, x )
%FUNCTION_HANDLE5 Summary of this function goes here
%   Detailed explanation goes here
    result = zeros(size(x));
    result(1) = x(2);
    result(2) = -2*x(1)-x(2);

end

