function [xts, ids] = PolysXPolys3DE(plys1, plys2, tol)
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

if nargin<3; tol = 0; end
m = length(plys1);
n = length(plys2);
xts = cell(m, 1);
ids = cell(m, 1);
Progress('PolysXPolys3DE');
for i=1:m
    pts = cell(n, 1);
    idx = zeros(n, 1);
    k = 0;
    for j=1:n
        xpt = PolyXPoly3D(plys1{i}, plys2{j}, tol);     %intersecting
        if isempty(xpt); continue; end
        k = k+1;
        pts{k} = xpt;                                   %points
        idx(k) = j;                                     %polygon index
    end
    if k==0; continue; end
    xts{i} = pts(1:k);
    ids{i} = idx(1:k);                                  %indices
    Progress('PolysXPolys3DE', i, m);
end
