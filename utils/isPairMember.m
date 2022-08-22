function fout=isPairMember(i,pair,e,S2)
	e=vertcat(e,[S2(i,1) S2(i,2)]);
	if(ismember(i,pair(:,1)) && ~ismember(i,pair(:,2)))
		for(r=1:size(pair,1))
			if(pair(r,1)==i)
				e=isPairMember(pair(r,2),pair,e,S2);
			end
		end
		fout=e;
	else
		fout=unique(e,'rows');
	end
end
