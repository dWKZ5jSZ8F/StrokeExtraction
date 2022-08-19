% Crossing number of p: Xr(p)=2*getNc(p).
% The number of 0-1 patterns of p : S(p) is defined as
% the number of 0-1 pattern in the ordered neighbors:
% p1, p2, ··· , p8, p1.

%% Pre-thinning
im_ref=padarray(image,[1 1],0,'both');
for(m=2:size(im_ref,1)-1)
	for(n=2:size(im_ref,2)-1)
		N=get8Neighbors(im_ref,m,n);
		Bodd=getBodd(N);
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
iter=0;
while(iter<floor(w/2))
	% 1st sub-iteration
	flag1=[];
	for(m=2:size(im_ref,1)-1)
		for(n=2:size(im_ref,2)-1)
			N=get8Neighbors(im_ref,m,n);
			B=getNb(N);
			Xr=getXr(N);
			if(im_ref(m,n) && B<=7)
				if(B>=2 && B<=6 && Xr==2 && ~(N(2)*N(6)*N(8)) && ~(N(4)*N(6)*N(8)))
					if(get2Pixels(N))
						if(mPreservation(im_ref,m,n))
							continue
						end
					end
					flag1=vertcat(flag1,[m n]);	   
				end
			end
		end
	end
	if(isempty(flag1))
		break
	end
	for(d1=1:size(flag1,1))
		im_ref(flag1(d1,1), flag1(d1,2))=0;
	end
	
	% 2nd sub-iteration
	flag2=[];
	for(m=2:size(im_ref,1)-1)
		for(n=2:size(im_ref,2)-1)
			N=get8Neighbors(im_ref,m,n);
			B=getNb(N);
			Xr=getXr(N);
			if(im_ref(m,n) && B<=7)
				if(B>=2 && B<=6 && Xr==2 && ~(N(4)*N(6)*N(8)) && ~(N(2)*N(4)*N(6)))
					if(get2Pixels(N))
						if(mPreservation(im_ref,m,n))
							continue
						end
					end
					flag2=vertcat(flag2,[m n]);	   
				end
			end
		end
	end
	if(isempty(flag2))
		break;
	end
	for(d2=1:size(flag2,1))
		im_ref(flag2(d2,1), flag2(d2,2))=0;
	end
	iter=iter+1;
end

thinned=im_ref(2:end-1,2:end-1);

