function endpoints=endpoint(contour)
	% initializing empty canvas
	contour_sorted=false(size(contour));
	contour1=contour;
	endpoints=[];
	temp=1;

	% while loop condition: 
	% work until all pixels in contour is recorded.
	while sum(contour1, 'all')~=0
		elements=[];
		theta=[];

		% scanning through the canvas to find a starting point
		n=1;
		while n<=size(contour1, 1)
			m=1;
			while m<=size(contour, 2)
				if contour1(m, n)==1
					elements=[m n];
					break
				end
				m=m+1;
			end
			if isempty(elements)==false
				break
			end
			n=n+1;
		end
		
		% If there is no more pixels left, break the loop.
		if(m==190 && n==190)
			break
		end
		
		% For the single pixels
		if (contour(m - 1, n - 1) <= 0 && contour(m - 1, n) <= 0 && contour(m - 1, n + 1) <= 0 ...
			&& contour(m, n - 1) <= 0 && contour(m, n + 1) <= 0 ...
			&& contour(m + 1, n - 1) <= 0 && contour(m + 1, n) <= 0 && contour(m + 1, n + 1) <= 0)
			contour_sorted(m, n) = 1;
			contour1 = (contour1 - contour_sorted);
			continue
		end

		% For the pixels that are leftout
		if (contour1(m - 1, n - 1) <= 0 && contour1(m - 1, n) <= 0 && contour1(m - 1, n + 1) <= 0 ...
			&& contour1(m, n - 1) <= 0 && contour1(m, n + 1) <= 0 ...
			&& contour1(m + 1, n - 1) <= 0 && contour1(m + 1, n) <= 0 && contour1(m + 1, n + 1) <= 0)
			if (contour_sorted(m - 1, n - 1) == 1 || contour_sorted(m - 1, n) == 1 || contour_sorted(m - 1, n + 1) == 1 ...
				|| contour_sorted(m, n - 1) == 1 || contour_sorted(m, n + 1) == 1 ...
				|| contour_sorted(m + 1, n - 1) == 1 || contour_sorted(m + 1, n) == 1 || contour_sorted(m + 1, n + 1) == 1)
				contour_sorted(m, n) = 1;
				contour1 = (contour1 - contour_sorted);
				continue
			end
		end

		current=[m n];
		init=current;
		check=[];

		% while loop:
		% label the contour for further endpoint angle detection.
		% (temporarily store in [elements])
		while 1
			while 1
				flag = 0;
				if isempty(check)
					check = [current(1) (current(2) - 1)];
				end
				if check(1, 2) < current(1, 2)
					while check(1, 1) >= current(1, 1)        % check until top left
						check = [(check(1, 1) - 1) check(1, 2)];
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							flag = 1;
							break 
						end
					end
					if flag == 1
						break
					else
						check = [check(1, 1) (check(1, 2) + 1)];   % move on to the top center
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							break
						end
					end
				end
				if check(1, 2) > current(1, 2)            % if check is at the right side of the current pixel
					while check(1, 1) <= current(1, 1)        % check until bottom right
						check = [(check(1, 1) + 1) check(1, 2)];
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							flag = 1;
							break
						end
					end
					if flag == 1
						break
					else
						check = [check(1, 1) (check(1, 2) - 1)];   % move on to the bottom center
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							break
						end
					end
				end 
				if check(1, 2) == current(1, 2)                % if check is at the same column of the current pixel            
					if check(1, 1) < current(1, 1)                % if top center
						check = [check(1, 1) (check(1, 2) + 1)]; % move to top right
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							break
						end
					else                                                % if bottom center
						check = [check(1, 1) (check(1, 2) - 1)]; % move to bottom left
						if contour1(check(1, 1), check(1, 2)) == 1
							elements = vertcat(elements, check);
							previous = current;
							current = check;
							check = previous;
							break
						end
				   end
			   end
			end
			if current == init
				break
			end
		end 

		% update sorted contour.
		for(i=1:size(elements, 1))
			contour_sorted(elements(i,1), elements(i,2))=1;
		end
		contour1=(contour1-contour_sorted);

		% if condition:
		% setup threshold of approx. 20 pixels,
		% [elements] cache with over 20 pixels will be considered as 
		% large component of the character, thus finding its corner(endpoint).
		if size(elements, 1) > 50
			% for loop condition:
			% b: current labelled pixel, d: distance
			% A: (B-9)pixel, B: current pixel, C: (B+9)pixel
			for b = 1 : size(elements, 1)
				d = 9;
				if b <= d
					backward = size(elements, 1) - d + b;
					A = [elements(backward, 1) elements(backward, 2)];
				else
					A = [elements(b - d, 1) elements(b - d, 2)];
				end
				B = [elements(b, 1) elements(b, 2)];
				if size(elements, 1) < b + d
					forward = b + d - size(elements, 1);
					C = [elements(forward, 1) elements(forward, 2)];
				else
					C = [elements(b + d, 1) elements(b + d, 2)];
				end
				v1 = A - B;
				v2 = C - B;
				theta_inrad = acos(dot(v1, v2) / sqrt(sum(v1.^2)*sum(v2.^2)));
				theta_indeg = (theta_inrad * 180)/pi;
				theta(b, 1) = theta_inrad;
				theta(b, 2) = theta_indeg;
			end
			for b = 1 : size(theta, 1)
				flag1 = 0;
				if theta(b, 1) >= pi/4
					continue
				end
				for ref = 1 : 9
					back = b - ref;
					if back <= 0 
						back = size(theta, 1) + back;
					end
					if theta(back, 1) < theta(b, 1)
						flag1 = 1;
						break
					end
					front = b + ref;
					if front > size(theta, 1)
						front = front - size(theta, 1);
					end
					if theta(front, 1) < theta(b, 1)
						flag1 = 1;
						break
					end
				end
				if flag1 == 0
					endpoints(temp, 1) = elements(b, 1);
					endpoints(temp, 2) = elements(b, 2);
					temp = temp + 1;
				end
			end         
		end
	end
end
