function fout=mPreservation(A,m,n)
	scene1=((A(m,n-1)&&A(m,n+1)&&A(m+1,n-1)&&A(m+1,n)&&A(m+1,n+1)) && (~A(m-1,n)&&~A(m+2,n)));
	scene2=((A(m-1,n)&&A(m-1,n-1)) && (~A(m-2,n)&&~A(m-2,n+1)&&~A(m-1,n+1)&&~A(m,n+1)&&~A(m,n-1)&&~A(m+1,n-1)&&~A(m+1,n)));
	scene3=((A(m+1,n)&&A(m+1,n+1)) && (~A(m+2,n)&&~A(m+2,n-1)&&~A(m+1,n-1)&&~A(m,n+1)&&~A(m,n-1)&&~A(m-1,n+1)&&~A(m-1,n)));
	scene4=((A(m,n+1)&&A(m+1,n)&&A(m+1,n+1)) && (~A(m-1,n-1)&&~A(m-1,n)&&~A(m-1,n+1)&&~A(m-1,n+2)&&~A(m,n-1)&&~A(m,n+2)&&~A(m+1,n-1)&&~A(m+1,n+2)&&~A(m+2,n-1)&&~A(m+2,n)&&~A(m+2,n+1)&&~A(m+2,n+2)));
	scene5=((A(m,n+1)&&A(m+1,n+1)) && (~A(m-1,n)&&~A(m-1,n+1)&&~A(m-1,n+2)&&~A(m,n-1)&&~A(m,n+2)&&~A(m+1,n-1)&&~A(m+1,n)));
	scene6=((A(m,n+1)&&A(m-1,n)&&A(m-1,n+1)&&A(m+1,n)&&A(m+1,n+1)) && (~A(m,n-1)&&~A(m,n+2)));
	scene7=((A(m,n-1)&&A(m+1,n-1)) && (~A(m-1,n)&&~A(m-1,n-1)&&~A(m-1,n-2)&&~A(m,n+1)&&~A(m,n-2)&&~A(m+1,n+1)&&~A(m+1,n)));
	scene8=((A(m+1,n)&&A(m+1,n-1)) && (~A(m-1,n)&&~A(m-1,n-1)&&~A(m-1,n-2)&&~A(m,n+1)&&~A(m,n-2)&&~A(m+1,n+1)&&~A(m,n-1)));
	fout=scene1||scene2||scene3||scene4||scene5||scene6||scene7||scene8;
end
