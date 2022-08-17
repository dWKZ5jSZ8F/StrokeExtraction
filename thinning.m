% Crossing number of p: Xr(p)=2*getNc(p).
% The number of 0-1 patterns of p : S(p) is defined as
% the number of 0-1 pattern in the ordered neighbors:
% p1, p2, ··· , p8, p1.

%% Pre-thinning
im_ref=padarray(image,[1 1],0,'both');
for(m=2:size(im_ref,1)-1)
	for(n=2:size(im_ref,2)-1)
		Bodd=getBodd(im_ref,m,n);
		if(Bodd<2)
			im_ref(m,n)=0;
		elseif(Bodd>2)
			im_ref(m,n)=1;
		end 
	end
end

% The number of nonzero neighbors of p : B(p) = p1 +p2 +
% ··· + p8.
% i.e. B(p)=getNb(p);
%% 1st sub-iteration
flag1=[];
for(m=2:size(im_ref,1)-1)
	for(n=2:size(im_ref,2)-1)
		B=getNb(im_ref,m,n);
		Xr=2*getNc(im_ref,m,n);
		N=get8Neighbors(im_ref,m,n);
		if(B>=2 && B<=6 && Xr==2 ...
			&& !(N(2)*N(4)*N(8)) ...
			&& !(N(2)*N(4)*N(6)))
			flag1=vercat(flag1,[m n]);	   
		end
	end
end


%% 2nd sub-iteration
flag2=[];
for(m=2:size(im_ref,1)-1)
	for(n=2:size(im_ref,2)-1)
		B=getNb(im_ref,m,n);
		Xr=2*getNc(im_ref,m,n);
		N=get8Neighbors(im_ref,m,n);
		if(B>=2 && B<=6 && Xr==2 ...
			&& !(N(2)*N(4)*N(8)) ...
			&& !(N(4)*N(6)*N(8)))
			flag2=vercat(flag2,[m n]);	   
		end
	end
end

%% Deletion
for(d1=1:size(flag1,1))
	im_ref(flag1(d1,1), flag1(d1,2))=0;
end
for(d2=1:size(flag2,1))
	im_ref(flag2(d2,1), flag2(d2,2))=0;
end

skel=im_ref(2:end-1,2:end-1);
