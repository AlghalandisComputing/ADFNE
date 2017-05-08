function clys = ClipPolys3D(plys, bx)
% ClipPolys3D
% clips 3D polygons by a box
%
% Usage :
% clys = ClipPolys3D(plys, bx)
%
% input : plys      cell(n)
%         bx        (6)
% output: clys      cell(m)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; bx = [0, 1, 0, 1, 0, 1]; end
x1 = bx(1); x2 = bx(2); y1 = bx(3);
y2 = bx(4); z1 = bx(5); z2 = bx(6);
xy1 = createPlane([x1, y1, z1], [0, 0, -1]);
xy2 = createPlane([x1, y1, z2], [0, 0, 1]);
xz1 = createPlane([x1, y1, z1], [0, -1, 0]);
xz2 = createPlane([x1, y2, z1], [0, 1, 0]);
yz1 = createPlane([x1, y1, z1], [-1, 0, 0]);
yz2 = createPlane([x2, y1, z1], [1, 0, 0]);
n = size(plys, 1);
clys = cell(n, 1);
for i=1:n
    ply = plys{i};
    ply = clipConvexPolygon3dHP(ply, xy1);
    ply = clipConvexPolygon3dHP(ply, xy2);
    ply = clipConvexPolygon3dHP(ply, xz1);
    ply = clipConvexPolygon3dHP(ply, xz2);
    ply = clipConvexPolygon3dHP(ply, yz1);
    ply = clipConvexPolygon3dHP(ply, yz2);
    if all(ply(1, :)==ply(end, :)); ply = ply(1:end-1, :); end
    clys{i} = ply;
end
