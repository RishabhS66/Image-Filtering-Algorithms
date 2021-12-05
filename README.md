# Image Processing Filters
```
Coded By: Rishabh Srivastava
```
This repository contains code for 2 filters that are predominantly used for smmothening image features and reducing the noise content of an image.

## Bilateral Filter

A bilateral filter is a non-linear, edge-preserving, and noise-reducing smoothing filter for images. It replaces the intensity of each pixel with a weighted average of intensity values from nearby pixels. The basic idea underlying bilateral filtering is to do in the range of an image what traditional filters do in its domain. Two pixels can be _close_ to one another, that is, occupy nearby spatial location, or they can be _similar_ to one another, that is, have nearby values, possibly in a perceptually meaningful fashion.

The bilateral filter can be formulated as :
<div align = "center">
  <img src = "https://user-images.githubusercontent.com/39689610/118398869-09b32c00-b678-11eb-877e-8084c53d357a.png" width = "450" height = "200">
</div>
<br>

As the range parameter <img src = "https://user-images.githubusercontent.com/39689610/118401148-1a689f80-b682-11eb-9104-6d8ebe4f4e11.png" width = "15.8" height = "12"> increases, the bilateral filter gradually approaches Gaussian convolution more closely because the range Gaussian widens and flattens, which means that it becomes nearly constant over the intensity interval of the image. Thus, as <img src = "https://user-images.githubusercontent.com/39689610/118401148-1a689f80-b682-11eb-9104-6d8ebe4f4e11.png" width = "15.8" height = "12"> increases, the image gets more blurred.

As the spatial parameter <img src = "https://user-images.githubusercontent.com/39689610/118401209-5b60b400-b682-11eb-9077-cbef317da2ef.png" width = "18" height = "12"> increases, the larger features get smoothened.


This repository includes code that applies a bilateral filter on the image _MinaretLake.jpg_.

The **results** are displayed below:

<div align = "center">
  <kbd>
    <img src = "https://user-images.githubusercontent.com/39689610/118399970-564d3600-b67d-11eb-9105-079181af4a14.png" width = "300" height = "409">
    <img src = "https://user-images.githubusercontent.com/39689610/118399979-5ea57100-b67d-11eb-9d24-38c1b91e9e31.png" width = "300" height = "409">
  </kbd>
</div>

## Non-Local Means Filter

Non-Local Means is an algorithm in image processing for image denoising. The method is based on a simple principle: replacing the color of a pixel with an average of the colors of similar pixels. Non-Local Means filtering takes a mean of all pixels in the image, weighted by how similar these pixels are to the target pixel. 

To speed up execution of the algorithm, one can restrict the computation of the mean for each pixel to a search window centred on the pixel itself, instead of the whole image. 

This repository includes codes for implementing the Non-Local Means filter on the image _lenna.noise.jpg_.

The **results** are displayed below:

<div align = "center">
  <kbd>
    <img src = "https://user-images.githubusercontent.com/39689610/118402483-a9c48180-b687-11eb-8a98-5142b09afeca.png" width = "355.5" height = "360">
    <img src = "https://user-images.githubusercontent.com/39689610/118402497-bd6fe800-b687-11eb-9f52-a2f67756d496.png" width = "349.3" height = "360">
  </kbd>
</div>
