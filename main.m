clc; clear;
addpath('./utils/')

%% Preprocessing
path="image/";
filename="";
preprocess;

%% Ambiguity detection
% Contour extraction
boundary=bwperim(image1,4);	% extract contour using erosion
% Feature point detection
skel=kmm(image);		% thinning using KMM algorithm


