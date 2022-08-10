clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="5.bmp";
preprocess;

%% Ambiguity detection
% Contour extraction
contour=bwperim(image,4);     % extract contour using erosion
% Feature point detection
skel=kmm(image);		        % thinning using KMM algorithm
featureExtraction;
doubleThreshold;

% Endpoint feature extraction
% endpoints=endpoint(contour);
% endptConnect;
% feature_plots;

%% Demo
% figure; 
