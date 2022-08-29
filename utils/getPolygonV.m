function [V]=getPolygonV(contour,m,n,spurs)
	sze=5;
	contour=padarray(contour,[sze sze],0,'both');
	canvas=contour(m:m+sze*2,n:n+sze*2);
	V=[];
	%{
	%% This is for the shortest point for finding polygon.
	for(p=1:spurs)
		mn=100;
		pos=[];
		for(row=1:size(canvas,1))
			for(col=1:size(canvas,2))
				if(canvas(row,col))
					dist=sqrt((row-(sze+1))^2+(col-(sze+1))^2);
					display(dist);
					if(dist<mn)
						mn=dist;
						pos=[row col];
					end
				end
			end
		end
		canvas(pos(1),pos(2))=0;
		V=vertcat(V,[m+(pos(1)-(sze+1)) n+(pos(2)-(sze+1))]);
	end		
	%}
end
