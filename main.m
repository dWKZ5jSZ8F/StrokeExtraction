clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="5.bmp";
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
N=sum(image,'all');		% sum of all foreground pixels
L=sum(contour,'all');	% total length of contour
w=2*N/L; 				% Estimation of stroke width
skel=kmm(image,'n',w);		        % thinning using KMM algorithm
figure;
imshow(skel);
% skel=thinning(image,'n',w);
featureExtraction;
doubleThreshold;
imCFP=feature_plots(CFP,skel,'R');
imE=feature_plots(endpoints,skel,'G');
imSCFP=feature_plots(SCFP,skel,'B');
figure; imshow(imCFP);
figure; imshow(imE);
figure; imshow(imSCFP);
close all;
% Ambiguous zone identification
halfthinned=kmm(image,'h',w);
figure; imshow(halfthinned);
ambiguousZone;

%% Demo

