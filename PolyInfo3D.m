function [cts, szs, ds, dds, n] = PolyInfo3D(plys, tn)
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

if nargin<2; tn = 9; end
n = length(plys);
cts = Centroid3D(plys);
szs = Size3D(plys);
[ds, dds] = Orientation3D(plys);
dds = FixZero(dds);
ds = FixZero(ds);
dds = mod(2*pi+dds, 2*pi);                  %Dip Direction
f = (ds<=0);
ds(f) = ds(f)+pi/2;                         %Dip
ds = Trunc(ds, tn);
dds = Trunc(dds, tn);
