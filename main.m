clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="2.bmp";
preprocess;

%% Ambiguity detection
% Contour extraction
boundary=bwperim(image1,4);	% extract contour using erosion
% Feature point detection
skel=kmm(image);		% thinning using KMM algorithm

%% Demo
figure; 
subplot(1, 2, 1)
imshow(skel)
subplot(1, 2, 2)
imshow(boundary)
