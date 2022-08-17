function imout=feature_plots(ft,imin)
	imout=b2rgb(imin);
	% plot endpoints with red dots.
	for i = 1:size(ft, 1)
		for(row=ft(i,1)-1:ft(i,1)+1)
			for(col=ft(i,2)-1:ft(i,2)+1)
				imout(row,col,1) = 255;
				imout(row,col,2) = 0;
				imout(row,col,3) = 0;
			end
		end
	end
end
