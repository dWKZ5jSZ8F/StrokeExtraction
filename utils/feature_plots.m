function imout=feature_plots(ft,imin)
	imout=b2rgb(imin);
	% plot endpoints with red dots.
	for i = 1:size(ft, 1)
		imout(ft(i, 1), ft(i, 2), 1) = 255;
		imout(ft(i, 1), ft(i, 2), 2) = 0;
		imout(ft(i, 1), ft(i, 2), 3) = 0;
	end
end
