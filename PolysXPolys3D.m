function [xts, pts, ids] = PolysXPolys3D(plys1, plys2)
% PolysXPolys3D
% finds intersection (points, indices) between two sets of 3D polygons
%
% Usage:
% [xts, pts, ids] = PolysXPolys3D(plys1, plys2)
%
% input : plys1     cell of polygons
%         plys2     cell of polygons
% output: xts       (k, 3), cell
%         pts       stacked intersection points, i.e., (k, 2)
%         ids       indices, cell
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

m = length(plys1);
n = length(plys2);
xts = cell(m, 1);
ids = [];
u = 0;
for i=1:m
    pts = cell(n, 1);
    idx = zeros(n, 1);
    k = 0;
    for j=1:n
        xpt = PolyXPoly3D(plys1{i}, plys2{j});      %intersecting
        if isempty(xpt); continue; end
        k = k+1;
        pts{k} = xpt;                               %points
        idx(k) = j;                                 %polygon index
    end
    if k==0; continue; end
    u = u+1;
    xts{u} = pts(1:k);
    ids = union(ids, idx(1:k));                     %indices
end
xts = xts(1:u);
pts = zeros(0, 3);
k = 0;
for i=1:u
    cps = xts{i};                                   %stacking all intersection points
    for j=1:size(cps, 1)
        ets = cps{j};
        for w=1:size(ets, 1)
            k = k+1;
            pts(k, :) = ets(w, :);
        end
    end
end
