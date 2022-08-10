clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="6.bmp";
preprocess;

%% Ambiguity detection
% Contour extraction
contour=bwperim(image1,4);     % extract contour using erosion
% Feature point detection
skel=kmm(image);		        % thinning using KMM algorithm
% Endpoint feature extraction
endpoints=endpoint(contour);
endptConnect;
feature_plots;

%% Demo
% figure; 
