function imout=feature_plots(ft,imin,color,r)
	if(isa(imin,'logical'))
		imout=b2rgb(imin);
	else
		imout=imin;
	end
	% plot endpoints with colored dots.
	R=0;
	G=0;
	B=0;
	if(color=='R')
		R=255;
	elseif(color=='G')
		G=255;
	elseif(color=='B')
		B=255;
	end
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
