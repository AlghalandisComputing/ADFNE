function oly = PolyToDipDir3D(ply, dip, ddir)
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

if nargin<3; ddir = 0; end                      %dip direction
if nargin<2; dip = 0; end                       %dip
T = composeTransforms3d(createRotationOy(-pi/2+dip), createRotationOz(ddir));
if (nargin<1) || isempty(ply)
    ply = [0, -1, -1;0, 1, -1;0, 1, 1;0, -1, 1];
    oly = transformPoint3d(ply, T);
else
    [cts, ~, ds, dds, ~] = PolyInfo3D({ply});
    oly = transformPoint3d(ply, composeTransforms3d(createRotationOz(-dds), ...
        createRotationOy(-ds+pi/2)));
    oly = Translate3D(oly, cts-Centroid3D({oly}));
    oly = transformPoint3d(oly, T);
    oly = Translate3D(oly, cts-Centroid3D({oly}));
end
