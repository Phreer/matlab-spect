function [result] = rmse(A, ref)
%RMSE Compute root mean square error of A and ref
result = sqrt(mean((A(:) - ref(:)) .^ 2));
end

