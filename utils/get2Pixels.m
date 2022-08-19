function fout=get2Pixels(N)
	bool1=(N(2)*N(3));
	bool2=(N(3)*N(4));
	bool3=(N(4)*N(5));
	bool4=(N(5)*N(6));
	bool5=(N(6)*N(7));
	bool6=(N(7)*N(8));
	bool7=(N(8)*N(1));
	bool8=(N(1)*N(2));
	fout=(bool1||bool2||bool3||bool4||bool5||bool6||bool7||bool8);
end
