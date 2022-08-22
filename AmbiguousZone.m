% Sa is the estimated fork points.
Sa=[];
% S2 is the set of true CFP only: S2=Sf-S1
S2=setdiff(CFP,SCFP,'stable','rows');
im_S2=zeros(size(skel));
for(pt=1:size(S2,1))
	im_S2(S2(pt,1),S2(pt,2))=1;
end

% Rule 1
pair=[];
for(pt1=1:size(S2,1)-1)
	for(pt2=pt1+1:size(S2,1))
		dist=sqrt((S2(pt2,1)-S2(pt1,1))^2+(S2(pt2,2)-S2(pt1,2))^2);
		if(dist<ceil(dl))
			pair=vertcat(pair,[pt1 pt2]);
		end
	end
end
display(pair);
for(i=1:size(S2,1))
	if(ismember(i,pair))
		display(i);
	else
		Sa=vertcat(Sa,[S2(i,1) S2(i,2)]);
		display(Sa);
	end
end


% Rule 2
%{
im_S3=bwperim(halfthinned);
im_S5=bitand(bitxor(~skel,im_S3),im_S2);
figure; imshow(im_S5);
for(m=1:size(im_S5,1))
	for(n=1:size(im_S5,2))
		if(im_S5(m,n))
			N=get8Neighbors(im_S5,m,n);
			for(i=1:size(N))
				if(N(i))
%}
