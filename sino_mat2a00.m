index = 49;
sino = read_sinogram_norm_mat(...
    sprintf('subMat_nor/hospital_real_%d.mat', floor(index / 16)), ...
    mod(index, 16));

filename_out = sprintf('hospital_real_%d.a00', index);
fd = fopen(filename_out, 'w');
fwrite(fd, sino', 'double');
fclose(fd);