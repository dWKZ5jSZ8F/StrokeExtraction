contour=image;
[H,W] = size(contour);

%% Source image display
subplot(121);
imshow(contour);
title('Source image');

%% Look for first white pixel
[row_idx0,col_idx0] = find(contour,1,'first');
%chain=ObjectArray(zeros(1,500));
idx=1;
chain(idx)=dlnode(idx);
chain(idx).addPos(row_idx0,col_idx0);

%% Freeman code directions definition
Indice = [-1,-1,-1,0,1,1,1,0;  % Y move
	1,0,-1,-1,-1,0,1,1]; % X move

%% Initializations
row_idx1 = row_idx0;
col_idx1 = col_idx0;
Contour1 = zeros(H,W);    % contour initialization
Contour1(row_idx1,col_idx1) = 1;      % 1st point definition
dir = 8;                 % sweep starting direction
code(1,1) = dir;         % code vector
dir0 = mod(dir+3-1,8) + 1; % opposite direction -1

%% 2nd point detection
contour(row_idx0,col_idx0) = 0; % to enter the loop but must set back I to 255 after

while ~contour(row_idx1,col_idx1)

	row_idx1 = row_idx0 + Indice(1,dir0); % 2nd point coordinates
	col_idx1 = col_idx0 + Indice(2,dir0); % from index matrix

	if dir0 ~= 1

		dir0 = dir0 - 1; % direction definition

	else

		dir0 = 8;

	end
end

contour(row_idx0,col_idx0) = 1; % set back true value of initial point
Contour1(row_idx1,col_idx1) = 1;
dir = dir0; % update dir

%% Coding other image points
row_idx2 = row_idx1; % 2nd temporary value
col_idx2 = col_idx1;
i = 2;


while row_idx2 ~= row_idx0 || col_idx2 ~= col_idx0

	idx=idx+1;
	chain(idx)=dlnode(idx);
	chain(idx).addPos(row_idx2,col_idx2);
	chain(idx).insertAfter(chain(idx-1));
	dir0 = mod(dir+3-1,8) + 1;
	contour(row_idx2,col_idx2) = 0; % to enter the loop but must set back I to 1 after

	while ~contour(row_idx1,col_idx1)

		if dir0 ~= 1

			dir0 = dir0 - 1; % direction definition

		else

			dir0 = 8;

		end

		row_idx1 = row_idx2 + Indice(1,dir0);  % next point coordinates
		col_idx1 = col_idx2 + Indice(2,dir0);  % from index matrix

	end

	dir = dir0;
	Contour1(row_idx2,col_idx2) = 1;
	code(1,i) = dir0;
	i = i + 1;
	contour(row_idx2,col_idx2) = 1; % set back true value of initial point
	row_idx2 = row_idx1;
	col_idx2 = col_idx1;
end

chain(idx).insertCircular(chain(1));

%% Freeman contour display
subplot(122);
imshow(Contour1);
title('Freeman coded image contour');
