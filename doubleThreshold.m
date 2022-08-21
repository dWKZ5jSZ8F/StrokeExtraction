%% Double Threshold method
% this method is dedicated to detect spurious CFPs (SCFPs)
SCFP=[];
dl=0.8*w;
dh=2.5*w;
for(i=1:size(CFP,1))
	N=get8Neighbors(~skel,CFP(i,1),CFP(i,2));
	if(getNb(N)==3)
		isSCFP=0;
		y=CFP(i,1); x=CFP(i,2);
		spurs=[];
		for(m=y-1:y+1)
			for(n=x-1:x+1)
				if(m==y && n==x)
					continue
				elseif(~skel(m,n))
					spurs=vertcat(spurs,[m n]);
				end
			end
		end
		% Loop for 3 candidate branches
		for(j=1:3)
			Lb=1;	% initialize the length of branch
			cur=[spurs(j,1) spurs(j,2)];
			prev=[y x];
			flag=0;
			isCFP=0;
			while(1)
				for(k=1:size(CFP,1))
					if(cur(1)==CFP(k,1) && cur(2)==CFP(k,2))
						flag=1;
						isCFP=1;
						break
					end
				end
				for(k1=1:size(endpoints,1))
					if(cur(1)==endpoints(k1,1) && cur(2)==endpoints(k1,2))
						flag=1;
						break
					end
				end
				if(flag)
					break 
				end
				tmp1=cur(1); tmp2=cur(2);
				for(q=tmp1-1:tmp1+1)
					flag1=0;
					for(r=tmp2-1:tmp2+1)
						if((q==prev(1) && r==prev(2)) || (q==cur(1) && r==cur(2)))
							continue
						elseif(~skel(q,r))
							prev=cur;
							cur=[q r];
							Lb=Lb+1;
							flag1=1;
							break
						end
					end
					if(flag1)
						break
                    end
				end
			end
			if(Lb<dl && ~isCFP)
				isSCFP=1;
				break
			end
		end
		if(isSCFP)
			SCFP=vertcat(SCFP,[CFP(i,1) CFP(i,2)]);
		end
    end
end 
