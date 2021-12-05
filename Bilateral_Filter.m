% Author: Rishabh Srivastava

% Bilateral Filtering

%% Reading input
Im1 = imread('MinaretLake.jpg');

% Image is in RGB format, so it is converted to grayscale
Im1 = rgb2gray(Im1);

[N, M] = size(Im1); % Image size

%% Padding images to handle calculation of final pixel intensities of boundary pixels
fs = 11; % Filter is of (fs x fs) size, fs should be odd preferably
ffs = floor(fs/2); 
Im1_pad = padarray(Im1, [ffs ffs], 'replicate'); % Replicates border pixel intensities ffs times

%% Image 1
sigma2_r1 = 1331; % Variance for range filter
sigma2_d1 = 121; % Variance for domain filter

Im1_filtered = zeros(N,M); % Will store the image obtained after applying bilateral filter

for i = 1:N
    for j = 1:M
        Im1_filtered(i,j) = bilateral_filtered(i+ffs,j+ffs,Im1_pad,sigma2_r1,sigma2_d1,ffs); % New pixel intensity
    end
end

%% Plotting figures corresponding to Image 1
figure();
imshow(Im1); % Input image
title('\fontsize{16}Image 1 : "MinaretLake.jpg"');

figure();
imshow(uint8(Im1_filtered)); % Output image obtained after filtering
title('\fontsize{16}Image 1 after Bilateral Filtering');

%% Function to calculate new pixel intensity after application of bilateral filter at pixel
function finalvalue = bilateral_filtered(posi, posj, Im, sigma2_r, sigma2_d,ffs)
%BILATERAL FILTERED returns the new pixel value

normalising_factor=0;
weighted_sum=0;
Ipij = double(Im(posi,posj));

% Loop that iterates over pixels in (fs x fs) mask centred at pixel (posi,posj)
for i = posi-ffs:posi+ffs
    for j = posj-ffs:posj+ffs
        Iij = double(Im(i,j));
        distval = (i-posi)^2 + (j-posj)^2; % To calculating weight of domain filter
        intensity_diff = (Iij - Ipij)^2; % To calculating weight of range filter
        wt = exp(-0.5 * intensity_diff/(sigma2_r)) * exp(-0.5 * distval/(sigma2_d)); % Calculate weight of filters combined
        normalising_factor = normalising_factor + wt;
        weighted_sum = weighted_sum + wt*Iij;
    end
end
finalvalue = weighted_sum/normalising_factor; % Caculate new pixel intensity 
finalvalue = round(finalvalue); % Round the value to nearest integer, since pixel intensity levels are integers
end
