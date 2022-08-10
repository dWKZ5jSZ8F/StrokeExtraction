%% Corner endpoint connection
skel1=skel;
for i = 1:size(endpoints, 1)
	skel1(endpoints(i,1), endpoints(i,2))=0;
    m = endpoints(i, 1);
    n = endpoints(i, 2);
    if (skel1(m - 1, n - 1) > 0 && skel1(m - 1, n) > 0 && skel1(m - 1, n + 1) > 0 ...
        && skel1(m, n - 1) > 0 && skel1(m, n + 1) > 0 ...
        && skel1(m + 1, n - 1) > 0 && skel1(m + 1, n) > 0 && skel1(m + 1, n + 1) > 0)
        k = 1;
        native = [];
        while 1
            for row = (m - k) : (m + k)
                for col = (n - k) : (n + k)
                    if row == m && col == n
                        continue
                    end
                    if skel1(row, col) <= 0
                        native = [row, col];
                        break
                    end
                end
                if isempty(native) == false
                    break
                end
            end
            if isempty(native) == false
                break
            end
            k = k + 1;
        end
        L = max(abs(native(1, 1) - m), abs(native(1, 2) - n));
        for N = 1 : (L - 1)
            skel1(m + round(((native(1, 1) - m) * N) / L), n + round(((native(1, 2) - n) * N) / L)) = 0;
        end
    end
end
