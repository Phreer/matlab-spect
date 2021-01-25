% filename = 'mdp_wb_128x342x120_nn1_d1222_01_tot_w1.a00';
% w = 128;
% h = 342;
% p = 120;
% idx = 120;

filename = 'jaszak_128x48x120_nn1_d1222_01_tot_w1.a00';
w = 128;
h = 48;
p = 120;
idx = 24;
Y = read_sinogram_norm_raw(filename, 'float', w, h, p);
img = Y(:, idx, :);
img = reshape(img, [w, p]);
img = normalize_max(img);
imshow(img)