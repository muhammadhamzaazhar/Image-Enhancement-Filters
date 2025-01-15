originalImage = im2double(imread("image"));
[m, n] = size(originalImage);

h = fspecial('gaussian', [5 5], 10);
im_blurred = imfilter(originalImage, h, 'conv', 'symmetric');

mean = 0;
variance = 0.01;
im_blur = imnoise(im_blurred, 'gaussian', mean, variance);

H = fft2(h, m, n);
H_al = abs(H) / max(max(abs(H)));

n = im_blur - im_blurred;

K_matrix = (abs(fft2(n)).^2) ./ (abs(fft2(originalImage)).^2);

G = fft2(im_blur);
G_func = abs(G) * 255 / max(max(abs(G)));

F = fft2(originalImage);
F_func = abs(F) * 255 / max(max(abs(F)));

H_func = conj(H);
fraction = H_func ./ ((abs(H).^2) + K_matrix);
temp = G .* fraction;
temp2 = ifft2(temp);
restoredImage = abs(temp2);

figure;
imshow(originalImage)
title("GrayScale Image")

figure;
imshow(im_blur)
title("Blurred Image")

figure;
imshow(restoredImage)
title("Restored Image")

figure;
imshow(fftshift(H_al))
title("FFT of Error function")

figure;
imshow(fftshift(G_func))
title("FFT of Distorted image")

figure;
imshow(fftshift(F_func))
title("FFT of Grayscale Image")

psnrval_e = psnr(im_blur, originalImage);
disp("PSNR - Blurred Image to Original Image")
disp(psnrval_e)
psnrval = psnr(restoredImage, originalImage);
disp("PSNR - Restored Image to Original Image")
disp(psnrval)