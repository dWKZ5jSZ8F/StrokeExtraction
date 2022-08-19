clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="4.bmp";
preprocess;

%{
%% Testing
thinning;
figure; imshow(skel);
%}

%% Ambiguity detection
% Contour extraction
contour=bwperim(image,4);     % extract contour using erosion
% Feature point detection
skel=kmm(image);		        % thinning using KMM algorithm
% thinning;
featureExtraction;
doubleThreshold;
imCFP=feature_plots(CFP,skel,'R');
imE=feature_plots(endpoints,skel,'G');
imSCFP=feature_plots(SCFP,skel,'B');
figure; imshow(imCFP);
figure; imshow(imE);
figure; imshow(imSCFP);
close all;
halfThinning;
figure; imshow(thinned);

%% Demo
% figure; 
