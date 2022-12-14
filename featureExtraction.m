%% Feature extraction
% find candidate fork points (CFPs) and endpoints
% using definition (1) & (2)
endpoints=[];
CFP=[];
skel_ref=padarray(~skel,[1 1],0,'both');
for(m=2:size(skel_ref,1)-1)
	for(n=2:size(skel_ref,2)-1)
		if(skel_ref(m,n))
			N=get8Neighbors(skel_ref,m,n);
			if(getNc(N)>=3 || getNb(N)>=4)
				CFP=vertcat(CFP,[m-1 n-1]);
			end
			if(getNb(N)==1)
				endpoints=vertcat(endpoints,[m-1 n-1]);
			end
		end
	end
end
