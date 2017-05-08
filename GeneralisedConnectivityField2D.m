function [CF, x, y] = GeneralisedConnectivityField2D(lines, La, gm, gn, rm, rn)
% GeneralisedConnectivityField2D
% computes generalised connectivity field (CF) for 2D fracture network
%
% Usage :
% [CF, x, y] = GeneralisedConnectivityField2D(lines, La, gm, gn, rm, rn)
%
% input : lines     (n, 4)
%         La        cluster labels (n)
%         gm        grid dimension vertically
%         gn        grid dimension horizontally
%         rm        range for cells vert.
%         rn        range for cells horiz.
% output: CF        (gm, gn)
%         x, y      extents
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

w = 1/gn;
h = 1/gm;
sm = length(rm);
sn = length(rn);
CF = zeros(gm, gn);
xCs = cell(gm, gn);
for i = 1:gm
    for j = 1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];
        xCs(i, j) = {SupXLines2D(sup, lines, La)};      %all supports' clusters information
    end
end
for i = 1:sm                                            %outer loop for all target cells
    for j = 1:sn
        xC1 = xCs{i, j};
        k = 0;
        for ii = 1:gm
            for jj = 1:gn
                com = intersect(xC1, xCs{ii, jj});
                if ~isempty(com); k = k+1; end          %record number of connected cells
            end
        end
        CF(rm(i), rn(j)) = k;
    end
end
x = [w/2, 1-w/2];                                       %for usage in imagesc(x, y, CF)
y = [h/2, 1-h/2];
