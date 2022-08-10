function fout=getNc(A,m,n)
	N=get8Neighbors(A,m,n);
	sm=0;
	for(i=1:8)
		sm=sm+abs(N(i+1)-N(i));
	end
	fout=sm/2;
end
