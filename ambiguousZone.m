% To find the  nearest points in contour 
% to form a polygon representation of ambiguous zone.
for(idx=1:size(Sa,1))
	if(~Sa(idx,3))
		N=get8Neighbors(~skel,Sa(idx,1),Sa(idx,2));
		spurs=getNb(N);
		V=getPolygonV(contour,Sa(idx,1),Sa(idx,2),spurs);
	else
		V=getPolygonV(contour,Sa(idx,1),Sa(idx,2),4);
		break
	end
end


