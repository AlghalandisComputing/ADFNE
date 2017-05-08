function [clys, plys] = GenFNM3D(n, dax, day, daz, s, rgn)
% GenFNM3D
% generates 3D fracture network
%
% Usage:
% [clys, plys] = GenFNM3D(n, dax, day, daz, s, rgn)
%
% input : n         number of polygons
%         dax,day,daz rotation angle range around X, Y and Z axes
%         s         scale
%         rgn       region of study,  default= unit cube
% output: clys      (n), cell, clipped polygons by region of study rgn
%         plys      (n), cell
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<6; rgn = [0, 1, 0, 1, 0, 1]; end
if nargin<5; s = 0.25; end
if nargin<4; daz = pi; end
if nargin<3; day = pi; end
if nargin<2; dax = pi; end
if nargin<1; n = 1; end
plys = cell(n, 1);
for i=1:n
    ply = [rand-0.5, -0.5, 0; -0.5, rand-0.5, 0; rand-0.5, 0.5, 0; 0.5, rand-0.5, 0];
    pt = rand(3, 3);
    T = composeTransforms3d(...
        createRotationOx([0, 0, 0], (2*rand-1)*dax), ...
        createRotationOy([0, 0, 0], (2*rand-1)*day), ...
        createRotationOz([0, 0, 0], (2*rand-1)*daz), ...
        createScaling3d(s, s, s), ...
        createTranslation3d(pt(1), pt(2), pt(3)));
    plys{i} = transformPoint3d(ply(:, 1), ply(:, 2), ply(:, 3), T);
end
clys = ClipPolys3D(plys, rgn);
