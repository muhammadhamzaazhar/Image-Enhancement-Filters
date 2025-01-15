# Image Restoration Techniques

This repository contains implementations of various image restoration techniques. The code demonstrates the use of adaptive filters, blind deconvolution, homomorphic filters, Lucy-Richardson deconvolution, and Wiener filtering. Each method restores degraded images and evaluates the performance using metrics such as Peak Signal-to-Noise Ratio (PSNR).

---

## Project Contents

### 1. Adaptive Filter
- **File:** `Adaptive Filter.ipynb`
- **Description:** Demonstrates adaptive filtering for noise reduction in images using Python.

### 2. Blind Deconvolution
- **File:** `Blind Deconvolution.m`
- **Description:** Implements the blind deconvolution algorithm to restore blurred images without prior knowledge of the point spread function (PSF).
- **Key Features:**
  - Simulates blur using Gaussian filters.
  - Restores images using PSFs of varying sizes (undersized, oversized, and correctly sized).
  - Evaluates PSNR for the restored images.

### 3. Homomorphic Filter
- **File:** `Homomorphic Filter.ipynb`
- **Description:** Applies homomorphic filtering to enhance image contrast and remove noise, implemented in Python.

### 4. Lucy-Richardson Deconvolution
- **File:** `Lucy Richardson.m`
- **Description:** Uses the Lucy-Richardson algorithm for image restoration, particularly effective for images degraded by Gaussian blur and noise.
- **Key Features:**
  - Adds Gaussian noise to blurred images.
  - Restores the image iteratively.
  - Computes PSNR between the original and restored images.

### 5. Wiener Filtering
- **File:** `Weiner.m`
- **Description:** Implements Wiener filtering to restore blurred and noisy images.
- **Key Features:**
  - Simulates blur using Gaussian filters.
  - Introduces Gaussian noise to the blurred image.
  - Restores the image using Fourier transforms.
  - Visualizes frequency domain representations.
  - Computes PSNR for the restored images.

---

## Usage
### Running .ipynb Files on Google Colab
1. Upload the .ipynb file to your Google Drive.
2. Open Google Colab.
3. Select File > Upload notebook and upload the file.

### Running .m Files on MATLAB Online
1. Navigate to MATLAB Online.
2. Upload the .m file to your MATLAB Online workspace.
3. Ensure the input image file is available in the same directory.
4. Run the script to observe results.

