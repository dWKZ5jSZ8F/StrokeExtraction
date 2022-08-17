function fout=getBodd(A,m,n)
	N=get8Neighbors(A,m,n);
	fout=N(2)+N(4)+N(6)+N(8);
end
