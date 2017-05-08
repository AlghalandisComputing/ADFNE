function [CI, x, y] = ConnectivityIndex2D(lines, La, gm, gn, cm, cn)
% ConnectivityIndex2D
% computes connectivity index (CI) on 2D fracture networks
%
% Usage :
% [CI, x, y] = ConnectivityIndex2D(lines, La, gm, gn, cm, cn)
%
% input : lines     (n, 4)
%         La        cluster labels (n)
%         gm        grid dimension vertically
%         gn        grid dimension horizontally
%         cm        target cell i index
%         cn        target cell j index
% output: CI        (gm, gn)
%         x, y      extents
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

w = 1/gn;
h = 1/gm;
CI = zeros(gm, gn);
xCs = cell(gm, gn);
for i = 1:gm                                            %extract cluster info for all supports
    for j = 1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];
        xCs(i, j) = {SupXLines2D(sup, lines, La)};      %store
    end
end
xC1 = xCs{cm, cn};                                      %target cell cluster info
if ~isempty(xC1)                                        %if target cell is not isolated
    for i = 1:gm
        for j = 1:gn
            com = intersect(xC1, xCs{i, j});            %any common cluster?
            if ~isempty(com); CI(i, j) = 1; end
        end
    end
end
x = [w/2, 1-w/2];                                       %for usage in imagesc(x, y, CI)
y = [h/2, 1-h/2];
