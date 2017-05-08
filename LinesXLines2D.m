function [xpss, idss] = LinesXLines2D(lines1, lines2)
% LinesXLines2D
% finds intersection indices and points between two sets of 2D fracture lines
%
% Usage:
% [xpss, idss] = LinesXLines2D(lines1, lines2)
%
% input : lines1    (m, 4)
%         lines2    (n, 4)
% output: xtss      intersection points, (cell)
%         idss      intersecting lines' indices, (cell)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

m = size(lines1, 1);
n = size(lines2, 1);
idss = cell(m, 1);
xpss = cell(m, 1);
u = 0;
for i = 1:m                                 %for all lines in lines1
    idx = zeros(1, 1);
    xps = zeros(1, 2);
    found = false;
    k = 0;
    for j = 1:n                             %for all lines in lines2
        xpt = intersectEdges(lines1(i, :), lines2(j, :));
        if ~isfinite(xpt(1)); continue; end
        k = k+1;
        idx(k) = j;
        xps(k, :) = xpt;
        found = true;
    end
    if found                                %record if there was any
        intersection
        u = u+1;
        idss(u) = {{i, idx}};
        xpss(u) = {xps};
    end
end
idss = idss(1:u);                           %compaction
xpss = xpss(1:u);
