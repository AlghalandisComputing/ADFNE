function plys = RandPoly3D(n, dax, day, daz)
% RandPoly3D
% generates randomly shaped and distributed 3D polygons
%
% Usage :
% plys = RandPoly3D(n, dax, day, daz)
%
% input : n         number of polygons
%         dax,day,daz rotation angle range around X, Y and Z axes
% output: ply       (n, 4, 3)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; daz = 2*pi; end
if nargin<3; day = 2*pi; end
if nargin<2; dax = 2*pi; end
if nargin<1; n = 1; end
plys = zeros(n, 4, 3);
for i=1:n
    r = rand(4, 1);
    ply = [r(1), 0, 0; 0, r(2), 0; r(3), 1, 0; 1, r(4), 0]; %random polygon with 4 vertices
    cnt = polygonCentroid3d(ply);
    T = composeTransforms3d(...
        createRotationOx(cnt, rand*dax), ...
        createRotationOy(cnt, rand*day), ...
        createRotationOz(cnt, rand*daz));
    plys(i, :, :) = transformPoint3d(ply(:, 1), ply(:, 2), ply(:, 3), T);
end
