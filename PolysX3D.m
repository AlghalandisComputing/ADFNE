function [xts, ids, La] = PolysX3D(plys)
% PolysX3D
% finds all intersections between 3D polygons
%
% Usage:
% [xts, ids, La] = PolysX3D(plys)
%
% input : plys      cell(n)
% output: xts       cell
%         ids       cell
%         La        cluster labels
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

n = size(plys, 1);
m = n*(n-1)/2;
xts = cell(m, 1);
ids = cell(m, 1);
k = 0;
for i = 1:n-1
    for j = i+1:n
        xpt = PolyXPoly3D(plys{i}, plys{j});
        if isempty(xpt); continue; end
        k = k+1;
        xts{k} = xpt;                       %intersection points
        ids{k} = int32([i, j]);             %intersecting lines indices
    end
end
xts = xts(1:k);
ids = ids(1:k);
La = Labels(Clusters(ids), n);              %fracture cluster labels
