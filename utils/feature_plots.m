endpoints_plot=b2rgb(skel1);
% plot endpoints with red dots.
for i = 1:size(endpoints, 1)
	endpoints_plot(endpoints(i, 1), endpoints(i, 2), 1) = 255;
	endpoints_plot(endpoints(i, 1), endpoints(i, 2), 2) = 0;
	endpoints_plot(endpoints(i, 1), endpoints(i, 2), 3) = 0;
end
figure
imshow(endpoints_plot)
