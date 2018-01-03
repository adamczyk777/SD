function [ Time, Result ] = solver_function( handle, x0, t0, tk, t_step )
%SOLVER_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

    global epsilon;
    Result(:,1)=x0;
    Time(1)=t0;
    
    for i=1:tk/t_step+1
        Result(:,i+1)=Result(:,i) + t_step * feval(handle,Result(:,i), epsilon);
        Time(i+1) = t0 + t_step * (i);
    end
end

