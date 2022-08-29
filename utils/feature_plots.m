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
	r=0;
	for i = 1:size(ft, 1)
		for(row=ft(i,1)-r:ft(i,1)+r)
			for(col=ft(i,2)-r:ft(i,2)+r)
				imout(row,col,1) = R;
				imout(row,col,2) = G;
				imout(row,col,3) = B;
			end
		end
	end
end
