function result = handle_lorenz( x, ro, r, b )
%LORENZ Summary of this function goes here
%   Detailed explanation goes here
    result(1,1)=ro*(x(2,1)-x(1,1));
    result(2,1)=r*x(1,1)-x(2,1)-x(1,1)*x(3,1);
    result(3,1)=-b*x(3,1)+x(1,1)*x(2,1);
end

