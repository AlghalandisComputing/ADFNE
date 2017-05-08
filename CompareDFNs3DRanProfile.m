function sim = CompareDFNs3DRanProfile(fnm1, fnm2, n, r, tol)
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

if nargin<5; tol = 6; end
if nargin<4; r = 2; end
if nargin<3; n = 10; end
ply = Translate3D([0, -r, -r;0, r, -r;0, r, r;0, -r, r], [0.5, 0.5, 0.5]);
dips = RandBetween(n, 0, pi/2);
ddirs = RandBetween(n, 0, 2*pi);
prfs = cell(0);
for i=1:n
    T = composeTransforms3d(createRotationOy(-pi/2+dips(i)), createRotationOz(ddirs(i)));
    prfs{i} = transformPoint3d(ply, T);
end
pfs1 = PointsToLines3D(PolysXPolys3DE(prfs, fnm1, tol));
pfs2 = PointsToLines3D(PolysXPolys3DE(prfs, fnm2, tol));
n = length(pfs1);
sms = zeros(n, 1);
for i=1:n
    a = isempty(pfs1{i});
    b = isempty(pfs2{i});
    if (a && ~b) || (~a && b)
        sms(i) = 0;
    elseif (a && b)
        sms(i) = 1;
    else
        sms(i) = mean(LineSimilarity2D(pfs1{i}, pfs2{i}));
    end
end
sim = mean(sms);
