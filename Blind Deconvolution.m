I = imread("image");
imshow(I);
title("Original Image");

% Simulating a Blur
PSF = fspecial("gaussian", 7, 10); % Gaussian filter
Blurred = imfilter(I, PSF, "symmetric", "conv");
figure, imshow(Blurred);
title("Blurred Image");

% Undersized PSF
UNDERPSF = ones(size(PSF) - 4);
[J1, P1] = deconvblind(Blurred, UNDERPSF);
figure, imshow(J1);
title("Deblurring with Undersized PSF");

% Oversized PSF
OVERPSF = padarray(UNDERPSF, [4 4], "replicate", "both");
[J2, P2] = deconvblind(Blurred, OVERPSF);
figure, imshow(J2);
title("Deblurring with Oversized PSF");

% PSF of correct size
INITPSF = padarray(UNDERPSF, [2 2], "replicate", "both");
[J3, P3] = deconvblind(Blurred, INITPSF);
figure, imshow(J3);
title("Deblurring with INITPSF");

figure;
subplot(2, 2, 1), imshow(PSF, [], 'InitialMagnification', "fit");
title("True PSF");
subplot(2, 2, 2), imshow(P1, [], 'InitialMagnification', "fit");
title("Reconstructed Undersized PSF");
subplot(2, 2, 3), imshow(P2, [], 'InitialMagnification', "fit");
title("Reconstructed Oversized PSF");
subplot(2, 2, 4), imshow(P3, [], 'InitialMagnification', "fit");
title("Reconstructed True PSF");

I = im2double(I); 
J1 = im2double(J1); 
J2 = im2double(J2);
J3 = im2double(J3);

PSNR_Undersized = psnr(J1, I);
PSNR_Oversized = psnr(J2, I);
PSNR_INITPSF = psnr(J3, I);

fprintf('PSNR with Undersized PSF: %.2f dB\n', PSNR_Undersized);
fprintf('PSNR with Oversized PSF: %.2f dB\n', PSNR_Oversized);
fprintf('PSNR with INITPSF: %.2f dB\n', PSNR_INITPSF);
