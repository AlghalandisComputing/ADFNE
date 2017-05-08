function [Ids, Xts] = LinesXPolys3D(lines, plys)
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

n = length(plys);
Xts = cell(0);
Ids = cell(0);
for i=1:n
    ply = plys{i};
    pln = createPlane(ply(1:3, :));
    xts = intersectEdgePlane(lines, pln);
    pt = planePosition(ply, pln);
    pd = planePosition(xts, pln);
    ids = xor(isPointInPolygon(pd, pt), polygonArea(pt)<0);
    xts(~ids, :) = NaN;
    Xts{i} = xts;
    Ids{i} = ids;
end
