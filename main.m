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
% thinning;
featureExtraction;
imCFP=feature_plots(CFP,skel);
imE=feature_plots(endpoints,skel);
figure; imshow(imCFP);
figure; imshow(imE);
doubleThreshold;

% Endpoint feature extraction
% endpoints=endpoint(contour);
% endptConnect;
% feature_plots;

%% Demo
% figure; 
