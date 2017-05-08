function xts = PolyXPoly3D(ply1, ply2, tol)
% PolyXPoly3D
% finds intersection points between two 3D polygons
%
% Usage :
% xts = PolyXPoly3D(ply1, ply2)
%
% input : ply1      (n, 3)
%         ply2      (m, 3)
% output: xts       (k, 3)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; tol = 0; end
xts = vertcat(PolyXPlane3D(ply1, ply2), PolyXPlane3D(ply2, ply1));
if ~isempty(xts)
    b = (isPointInPolygon(xts, ply1) & isPointInPolygon(xts, ply2));
    if tol>0; xts = Trunc(xts, tol); end
    xts = unique(xts(b, :), 'rows');
end
