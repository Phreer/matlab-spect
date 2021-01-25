function [Y] = normalize_max(Y)
%NORMALIZE_MAX Normalize the data Y to have maximum value 1 and minimum
%value 0.
Y = Y - min(min(min(Y)));
Y = Y / max(max(max(Y)));
end

