function fout = euclidean_dist(p1, p2)
	dist1 = (p1(1)-p2(1)).^2;
	dist2 = (p1(2)-p2(2)).^2;
	fout = sqrt(dist1+dist2);
end
