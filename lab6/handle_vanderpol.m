function result = handle_vanderpol( x, eps )
%VANDERPOL Summary of this function goes here
%   Detailed explanation goes here

    result(1,1)=x(2,1);
    result(2,1)=-x(1,1)+eps*x(2,1)*(1-x(1,1)^2);

end

