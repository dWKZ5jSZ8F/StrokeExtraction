% S2 is the set of true CFP only: S2=Sf-S1
S2=setdiff(CFP,SCFP,'stable','rows');
% display(S2);
Sa=[];
im_S3=bwperim(halfthinned);
S3=[];
for(row=1:size(im_S3,1))
	for(col=1:size(im_S3,2))
		if(im_S3(row,col))
			S3=vertcat(S3,[row col]);
		end
	end
end
S4=[];
figure; imshow(im_S3);
figure; imshow(skel);
for(row=1:size(skel,1))
	for(col=1:size(skel,2))
		if(~skel(row,col))
			S4=vertcat(S4,[row col]);
		end
	end
end
tmp1=union(S3,S4,'stable','rows');
tmp2=intersect(S3,S4,'stable','rows');
tmp=setdiff(tmp1,tmp2,'stable','rows');
test=zeros(size(skel));
for(i=1:size(tmp,1))
	test(tmp(i,1),tmp(i,2))=1;
end
figure;imshow(test);
S5=intersect(S2,tmp,'stable','rows');
display(S5);
