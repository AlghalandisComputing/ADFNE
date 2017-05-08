function [xts, ids, La] = LinesX2D(lines)
% LinesX2D
% finds intersection indices and points for a set of 2D fracture lines
%
% Usage :
% [xts, ids, La] = LinesX2D(lines)
%
% input : lines     (n, 4)
% output: xts       intersection points, (m, 2)
%         ids       intersecting lines indices, (m, 2)
%         La        cluster labels (n)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

n = size(lines, 1);
m = n*(n-1)/2;                          %max possible number of intersections
xts = zeros(m, 2);
ids = zeros(m, 2);
k = 0;
for i = 1:n-1                           %apply optimum iteration
    for j = i+1:n
        xpt = intersectEdges(lines(i, :), lines(j, :));
        if ~isfinite(xpt(1)); continue; end
        k = k+1;
        xts(k, :) = xpt;                %intersection points
        ids(k, :) = [i, j];             %intersecting lines' indices
    end
end
xts = xts(1:k, :);                      %compaction
ids = ids(1:k, :);
La = Labels(Clusters(num2cell(ids, 2)), n);     %fracture cluster labels
