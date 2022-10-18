clc; clear; close all;
addpath("./image/");
addpath("./class/");
addpath("./utils/");

%% Preprocessin
path="image/";
filename="5.bmp";
o_path="output/";
preprocess;

%% Ambiguity Detection
% Contour extraction
%contour=bwperim(image,4);     % extract contour using erosion
contourFollowing;
contour=Contour1;
% contour=bwperim(image,4);
% Feature point detection
N=sum(image,'all');		% sum of all foreground pixels
L=sum(contour,'all');	% total length of contour
w=2*N/L; 				% Estimation of stroke width
skel=kmm(image,'n',w);		        % thinning using KMM algorithm
% TODO: Fix the forkpoint deformation, etc. wu

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
for(i = 1:size(Sz,2))
	fig = zeros(189, 189);
	for(j = 1:size(Sz{i}, 1))
		if(~isnan(Sz{i}(j, 1)) && ~isnan(Sz{i}(j, 2)))
			fig(Sz{i}(j, 1), Sz{i}(j, 2)) = 1;
		end
	end
	figure;
	imshow(fig);
end

