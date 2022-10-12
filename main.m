clc; clear; close all;
addpath("./image/");
addpath("./class/");
addpath("./utils/");

%% Preprocessing
path="image/";
filename="5.bmp";
o_path="output/";
preprocess;

%% Ambiguity Detection
% Contour extraction
%contour=bwperim(image,4);     % extract contour using erosion
contourFollowing;
contour=bwperim(image,4);
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
forkpointEstimation;
display(S2)
display(Sa)
ambiguousZone;

%% Stroke Extraction

%% Demo
