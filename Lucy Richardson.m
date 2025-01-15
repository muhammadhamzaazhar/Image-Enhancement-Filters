I = imread("image");

figure;
imshow(I);
title("Original Image");

PSF = fspecial("gaussian", 5, 5);
Blurred = imfilter(I, PSF, "symmetric", "conv");

figure;
imshow(Blurred);
title("Blurred");

V = 0.001;
BlurredNoisy = imnoise(Blurred, "gaussian", 0, V);

figure;
imshow(BlurredNoisy);
title("Blurred & Noisy");

luc1 = deconvlucy(BlurredNoisy, PSF, 10);

figure;
imshow(luc1);
title("Restored Image, NUMIT = 10");

psnr_value = psnr(luc1, I);
disp(['PSNR between original and restored image (NUMIT = 10): ', num2str(psnr_value)]);
