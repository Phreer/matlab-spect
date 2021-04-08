function [ Y ] = read_tensor3d_norm_raw(filename, dtype, w, h, p)
%READ_SINOGRAM_NORM_A00 Read sinogram from raw data with data type and
%shape (w, h, p).
fid = fopen(filename, 'r');
data = fread(fid, w * h * p, dtype);
data = reshape(data, [w, h, p]);
fclose(fid);
Y = normalize_max(data);
end