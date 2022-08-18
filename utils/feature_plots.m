function imout=feature_plots(ft,imin,args)
	imout=b2rgb(imin);
	% plot endpoints with red dots.
	R=0;
	G=0;
	B=0;
	if(args=='R')
		R=255;
	elseif(args=='G')
		G=255;
	elseif(args=='B')
		B=255;
	end
	for i = 1:size(ft, 1)
		for(row=ft(i,1)-1:ft(i,1)+1)
			for(col=ft(i,2)-1:ft(i,2)+1)
				imout(row,col,1) = R;
				imout(row,col,2) = G;
				imout(row,col,3) = B;
			end
		end
	end
end
