function [bhl, wts, colors, clys, flys] = FNMfromBoreholeE5(fnm, p1, p2, r, m, attr)
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

if nargin<6; attr = {0.5, 0.01, 1}; end
if (nargin<5) || isnan(m); m = 64; end
if (nargin<4) || isnan(r); r = 0.05; end
Progress('FNMfromBorehole');
bhl = Borehole(r, m, p1, p2, -0.1);                         %Borehole
[~, wts, otl, lns, colors] = GetTraces3D(fnm, bhl);         %Traces
flys = GenPolysOnTraces3DE5(lns, otl, attr);                %Polys fitted on traces
clys = ClipPolys3D(flys);                                   %clipped
Progress('FNMfromBorehole', 1, 1);
