function fout=getXr(N)
	fout=0;
	for(i=1:8)
		fout=fout+abs(N(i+1)-N(i));
	end
end
