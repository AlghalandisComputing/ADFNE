function xts = PolyXPlane3D(ply, ply2)
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

edges = [ply, circshift(ply, [-1, 0])];
pln = createPlane(ply2(1:3, :));
xts = intersectEdgePlane(edges, pln);
xts = xts(sum(isnan(xts), 2)==0, :);
