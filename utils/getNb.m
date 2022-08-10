function fout=getNb(A,m,n)
	N=get8Neighbors(A,m,n);
	sm=0;
	for(i=1:8)
		sm=sm+N(i);
	end
	fout=sm;
end
