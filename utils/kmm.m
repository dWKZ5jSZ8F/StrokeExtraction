%% KMM Thinning Algorithm
function skel=kmm(image)
	deletionArray = [3      5      7      12     13     14     15     20  ...
					 21     22     23     28     29     30     31     48     ...
					 52     53     54     55     56     60     61     62     ...
					 63     65     67     69     71     77     79     80     ...
					 81     83     84     85     86     87     88     89     ...
					 91     92     93     94     95     97     99     101     ...
					 103    109    111    112    113    115    116    117    ...
					 118    119    120    121    123    124    125    126    ...
					 127    131    133    135    141    143    149    151    ...
					 157    159    181    183    189    191    192    193    ...
					 195    197    199    205    207    208    209    211    ...
					 212    213    214    215    216    217    219    220    ...
					 221    222    223    224    225    227    229    231    ...
					 237    239    240    241    243    244    245    246    ...
					 247    248    249    251    252    253    254    255];

	tagFourArray = bitxor([3   6   12  24  48  96  192 129 ...
					7   14  28  56  112 224 193 131 ...
					15  30  60  120 240 225 195 135],255);

	shift = 256;
	mask = [128 1 2; ...
			64 0 4; ...
			32 16 8];
	change = 1;
			
	while change
		outputImage = image > 0;
		workingImage = image;
		workingImage = padarray(workingImage, [1 1], 0);
		workingImage = workingImage == 0;
		workingImage = conv2(workingImage, mask, 'valid');

		% set 2's on mark image -- contour

		image = image + (workingImage > 0 & image > 0);

		% set 3's on tag image -- elbow points
		% this means that it has bits corresponding to any of numbers: 2, 8, 32, 128 on and to all of: 1, 4, 16, 64 off.

		on = sum([2 8 32 128]);
		off = sum([1 4 16 64]);
		image = image + ((image == 2) & bitand(workingImage, on) & ~bitand(workingImage, off));

		% set 4's on tag image 

		mask1 = (image > 1) & ismember(workingImage, tagFourArray);
		image = image .* ~mask1 + 4 * mask1;

		mask1 = (image == 4);
		image = image .* ~mask1;

		workingImage = zeros(size(image));
		w = size(image, 2);
		h = size(image, 1);
		image = padarray(image, [1 1], 0);
		for n = 2 : 3
			for i = 1 : h
		  		for j = 1 : w
					if image(i + 1, j + 1) ~= n
			  			continue;
					end
			
					workingImage(i, j) = sum(sum((image(i : i + 2, j : j + 2) > 0) .* mask));
			
					if ismember(workingImage(i, j), deletionArray)
			  			image(i + 1, j + 1) = 0;
					else
			  			image(i + 1, j + 1) = 1;
					end
		  		end
			end
		end
		image = image(2 : end - 1, 2 : end - 1);
		change = ~all(all(outputImage == (image > 0)));
	end
	skel=~outputImage;             % Final output by kmm thinning algorithm
end
