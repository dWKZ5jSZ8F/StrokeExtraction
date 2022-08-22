clc; clear;
addpath("./image/")
addpath("./utils/")

%% Preprocessing
path="image/";
filename="5.bmp";
o_path="output/";
preprocess;

%% Ambiguity detection
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
ambiguousZone;

%% Demo
imCFP=feature_plots(CFP,skel,'R');
% display(CFP);
% figure; imshow(imCFP);
im_Sa=feature_plots(Sa,skel,'R');
% display(Sa);
% figure; imshow(im_Sa);
% imwrite(imCFP,o_path+"CFP.png");
% imwrite(im_Sa,o_path+"Sa.png");
%close all;
