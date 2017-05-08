function [CF, Cn, Ln, x, y] = ConnectivityField2DE(lns, La, nx, ny)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : {}
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[C, Cn, Ln, gx, gy] = GridXLines2D(lns, La, nx, ny);
[m, n] = size(C);
CF = zeros(m, n);
for i=1:m                                           %outer loop for all target cells
    for j=1:n
        c1 = C{i, j};
        if isempty(c1); continue; end
        k = 0;
        for p=1:m
            for q=1:n
                c2 = C{p, q};
                if isempty(c2); continue; end
                com = intersect(c1, c2);
                if ~isempty(com); k = k+1; end      %record number of connected cells
            end
        end
        CF(i, j) = k;
    end
end
x = gx(1:end-1)+0.5*(gx(2)-gx(1));
y = gy(1:end-1)+0.5*(gy(2)-gy(1));
