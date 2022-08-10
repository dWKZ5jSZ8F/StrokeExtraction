function [fout]=get8Neighbors(A,m,n)
	p0=A(m-1,n+1);
	p1=A(m,n+1);
	p2=A(m+1,n+1);
	p3=A(m+1,n);
	p4=A(m+1,n-1);
	p5=A(m,n-1);
	p6=A(m-1,n-1);
	p7=A(m-1,n);
	p8=p0;
	fout=[p0,p1,p2,p3,p4,p5,p6,p7,p8];
end
