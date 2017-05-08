function sim = CompareDFNs3DProfile(fnm1, fnm2, nx, ny, nz, bbox, tol)
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

if nargin<7; tol = 6; end
if nargin<6; bbox = [0, 0, 0;1, 1, 1]; end
if nargin<5; nz = 4; end
if nargin<4; ny = 4; end
if nargin<3; nx = 4; end

prfs = ProfilesOnAxes3D(nx, ny, nz, bbox);
lnss1 = cell(0);
lnss2 = cell(0);
for i=1:length(prfs)
    lnss1{i} = PointsToLines3D(PolysXPolys3DE(prfs{i}, fnm1, tol));
    lnss2{i} = PointsToLines3D(PolysXPolys3DE(prfs{i}, fnm2, tol));
end
pfs1 = reshape(Stack(lnss1)', 1, [])';
pfs2 = reshape(Stack(lnss2)', 1, [])';
n = length(pfs1);
sms = zeros(n, 1);
for i=1:n
    sms(i) = mean(LineSimilarity2D(pfs1{i}, pfs2{i}));
end
sim = mean(sms);
