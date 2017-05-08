function [CF, x, y] = ConnectivityField2D(lines, La, gm, gn, rm, rn)
% ConnectivityField2D
% computes connectivity field (CF) for 2D fracture network
%
% Usage :
% [CF, x, y] = ConnectivityField2D(lines, La, gm, gn, rm, rn)
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

if nargin<6; rn = 1:gn; end
if nargin<5; rm = 1:gm; end
w = 1/gn;
h = 1/gm;
CF = zeros(gm, gn);
xCs = cell(gm, gn);
for i=1:gm
    for j=1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];
        xCs(i, j) = {SupXLines2D(sup, lines, La)};  %all supports' clusters information
    end
end
for i=rm                                            %outer loop for all target cells
    for j=rn
        xC1 = xCs{i, j};
        if isempty(xC1); continue; end
        k = 0;
        for ii=1:gm
            for jj=1:gn
                xC2 = xCs{ii, jj};
                if isempty(xC2); continue; end
                com = intersect(xC1, xC2);
                if ~isempty(com); k = k+1; end      %record number of connected cells
            end
        end
        CF(i, j) = k;
    end
end
x = [w/2, 1-w/2];                                   %for usage in imagesc(x, y, CF)
y = [h/2, 1-h/2];
