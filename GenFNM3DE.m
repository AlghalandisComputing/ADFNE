function [clys, plys] = GenFNM3DE(n, dip, ddip, ddir, dddir, s, rgn)
% GenFNM3DE
% {desc}
%
% Usage :
% {form}
%
% input : n         number of fractures
%         ddip      0:dip, >0:uniform, <0:Fisher(kappa=-ddip)
%         dddir     0:ddir, >0:uniform, <0:Fisher(kappa=-dddir)
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<7; rgn = [0, 1, 0, 1, 0, 1]; end
if nargin<6; s = 0.25; end
if nargin<5; dddir = 0; end
if nargin<4; ddir = 0; end
if nargin<3; ddip = 0; end
if nargin<2; dip = 0; end
if nargin<1; n = 1; end
%----dip
if ddip>0
    dp1 = dip-ddip;
    dp2 = dip+ddip;
    if dp1<0; dp1 = 0; end
    if dp2>(pi/2); dp2 = pi/2; end
    dps = ScaleE(rand(n, 1), 0, 1, dp1, dp2);       %dips
elseif ddip<0
    dps = RandDips(n, dip, -ddip);                  %dips (0 and 90) in radians
else
    dps = zeros(n, 1)+dip;
end
%----ddir
if dddir>0
    dd1 = ddir-dddir;
    dd2 = ddir+dddir;
    if dd1<0; dd1 = 0; end
    if dd2>(2*pi); dd2 = 2*pi; end
    dds = ScaleE(rand(n, 1), 0, 1, dd1, dd2);       %dip directions
elseif dddir<0
    dds = RandFisher(n, ddir, -dddir);              %Fisher(Von-Mises)
else
    dds = zeros(n, 1)+ddir;
end
%----polygons
plys = cell(n, 1);
for i=1:n
    ply = [0, rand-0.5, -0.5; 0, 0.5, rand-0.5; ...
        0, rand-0.5, 0.5; 0, -0.5, rand-0.5];
    pt = rand(1, 3);
    T = composeTransforms3d(...
        createRotationOy(-pi/2+dps(i)), ...
        createRotationOz(dds(i)), ...
        createScaling3d(s, s, s), ...
        createTranslation3d(pt));
    plys{i} = transformPoint3d(ply, T);
end
clys = ClipPolys3D(plys, rgn);
