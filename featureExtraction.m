%% Feature extraction
% find candidate fork points (CFPs) and endpoints
% using definition (1) & (2)
endpoints=[];
CFP=[];
skel_ref=padarray(~skel,[1 1],0,'both');
for(m=2:size(skel_ref,1)-1)
	for(n=2:size(skel_ref,2)-1)
		if(skel_ref(m,n))
			if(getNc(skel_ref,m,n)>=3 || getNb(skel_ref,m,n)>=4)
				CFP=vertcat(CFP,[m-1 n-1]);
			end
			if(getNb(skel_ref,m,n)==1)
				endpoints=vertcat(endpoints,[m-1 n-1]);
			end
		end
	end
end
