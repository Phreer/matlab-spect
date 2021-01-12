function [Y] = read_sinogram_norm_mat(filename, index)
Y = load(filename);
Y = Y.data;
p = size(Y, 1);
w = size(Y, 3);
Y = reshape(Y(:, index, :), p, w);
Y = double(Y);
Y = normalize_max(Y);
end