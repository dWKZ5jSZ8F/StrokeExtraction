% To form a polygons representation of ambiguous zones formed by CFPs.
Sz(1)={NaN(1,2)};	% The set of the vertices of the ambiguous zone
Sc(1)={NaN(1,2)};  % The set of contour pixels in ambiguous zone
dr = ceil(w);
for(i=1:size(Sa,1))
	mask = contour(Sa(i,1)-dr:Sa(i,1)+dr, Sa(i,2)-dr:Sa(i,2)+dr);			
	for(row=1:size(mask,1))
		for(col=1:size(mask,2))
			if(mask(row,col))
				d = euclidean_dist([row col], [5 5]);
				if(d<dr)
					if(size(Sc,2)<i)
						Sc(i)={[row+Sa(i,1)-dr-1 col+Sa(i,2)-dr-1]};
					else
						Sc{i}=vertcat(Sc{i}, [row+Sa(i,1)-dr-1 col+Sa(i,2)-dr-1]);
					end
				end
			end
		end
	end
end

%% Condition
Sz = step1(w, Sc, Sa, Sz);

%% Step 1
function Sz = step1(w, Sc, Sa, Sz)
	dm = 1.4 * w;
	for(i=1:size(Sc,2))
		argmin = 99999;
		argmin2 = 99999;
		argmin3 = 99999;
		pm=[];
		for(j=1:size(Sc{i},1))
			d = euclidean_dist([Sc{i}(j,1) Sc{i}(j,2)], [Sa(i,1) Sa(i,2)]);
			if(d==1)
				pm = vertcat(pm, [Sc{i}(j,1) Sc{i}(j,2) d]);
			elseif(d < argmin)
				argmin3 = argmin2;
				argmin2 = argmin;
				argmin = d;
				pm = vertcat(pm, [Sc{i}(j,1) Sc{i}(j,2) d]);
			elseif(d==argmin || d==argmin2 || d==argmin3)
				pm = vertcat(pm, [Sc{i}(j,1) Sc{i}(j,2) d]);
			elseif(d>argmin && d<argmin2)
				argmin3 = argmin2;
				argmin2 = d;
				pm = vertcat(pm, [Sc{i}(j,1) Sc{i}(j,2) d]);
			elseif(d>argmin2 && d<argmin3)
				argmin3 = d;
				pm = vertcat(pm, [Sc{i}(j,1) Sc{i}(j,2) d]);
			end
		end
		display(pm)
		display(argmin)
		display(argmin2)
		display(argmin3)
		for(pts=1:size(pm,1))
			% TODO: Add the condition of straight line (pc, pm) has no other contour points.
			if(pm(pts, 3) ~= argmin && pm(pts, 3) ~= argmin2 && pm(pts, 3) ~= argmin3 && pm(pts, 3) ~= 1)
				continue
			end
			if(euclidean_dist([pm(pts,1) pm(pts,2)], [Sa(i,1) Sa(i,2)]) < dm)
				if(size(Sz,2)<i)
					Sz(i)={[pm(pts,1) pm(pts,2)]};
				else
					Sz{i} = vertcat(Sz{i}, [pm(pts,1) pm(pts,2)]);
				end
			end
		end
	end
end

%% Step 2


%% Step 3
function step3(chain, Sz)
	for(i = 1:size(Sz, 2))
		cond_a = (size(Sz{i}, 1) < 3);
	end
end
