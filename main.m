clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="2.bmp";
preprocess;

%% Ambiguity detection
% Contour extraction
contour=bwperim(image1,4);     % extract contour using erosion
% Feature point detection
skel=kmm(image);		        % thinning using KMM algorithm
% Endpoint feature extraction
endpoints=endpoint(contour);
feature_plots;

%% Demo
% figure; 
