%% Input data
image=double(imread(path+filename))/255;

%% Binarization
im_R=image(:,:,1);
im_G=image(:,:,2);
im_B=image(:,:,3);
grayscale=0.299*im_R+0.587*im_G+0.114*im_B;
image=grayscale>(160/255);		% Thresholding 

%% Inverting
image=double(bitxor(image,1));
image1=image;
