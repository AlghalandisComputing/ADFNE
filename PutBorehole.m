function [bhl, wts, colors, clys, flys] = PutBorehole(fnm, p1, p2, s)
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

Progress('PutBorehole');
bhl = Borehole(0.05, 64, p1, p2, -0.1);                     %Borehole
[~, wts, otl, lns, colors] = GetTraces3D(fnm, bhl);         %Traces
flys = GenPolysOnTraces3D(lns, otl, s);                     %Polys fitted on traces
clys = ClipPolys3D(flys);                                   %clipped
Progress('PutBorehole', 1, 1);
