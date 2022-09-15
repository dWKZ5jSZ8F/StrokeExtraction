clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="6.bmp";
o_path="output/";
preprocess;

%% Ambiguity Detection
% Contour extraction
contour=bwperim(image,4);     % extract contour using erosion
% Feature point detection
N=sum(image,'all');		% sum of all foreground pixels
L=sum(contour,'all');	% total length of contour
w=2*N/L; 				% Estimation of stroke width
skel=kmm(image,'n',w);		        % thinning using KMM algorithm
% skel_alt=thinning(image,'n',w);
featureExtraction;
doubleThreshold;
% Ambiguous zone identification
halfthinned=kmm(image,'h',w);
CFPcorrection;
display(Sa);
display(S2);
ambiguousZone;
SPWT;

%% Stroke Extraction

%% Demo
% im_V=feature_plots(V,contour,'R');
% figure;imshow(im_V);
% figure;imshow(image);
