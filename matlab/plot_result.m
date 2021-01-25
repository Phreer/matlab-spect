index = 49; 
re_label = load('image/re.mat');
re_label = re_label.data;
re_label = re_label(index, :, :);
re_label = double(re_label);
re_label = reshape(re_label, 128, 128);
re_label = normalize_max(re_label);

theta = 0: 3: 357;
sino_out = read_sinogram_norm_mat(...
    sprintf('subMat_nor/hospital_real_%d.mat', floor(index / 16)), ...
    mod(index, 16));
re_out = iradon(sino_out', theta);
sino_in = read_sinogram_norm_mat('image/si.mat', index);
re_in = iradon(sino_in', theta);

figure;
subplot(2, 3, 1);
imshow(re_label);
title('医院重构算法');
subplot(2, 3, 2);
imshow(normalize_max(re_out));
title('使用降噪算法 2 降噪后重构');
subplot(2, 3, 3);
imshow(normalize_max(re_in));
title('使用带噪声弦图重构');

subplot(2, 3, 4);
sino_label = radon(re_label, theta);
imshow(normalize_max(sino_label)');
title('对医院重构图像进行拉登变换所得弦图');
subplot(2, 3, 5);
imshow(normalize_max(sino_out));
title('使用降噪算法 2 降噪所得弦图');
subplot(2, 3, 6);
imshow(normalize_max(sino_in));
title('带噪声弦图');
saveas(gcf, 'alg2_result.png');