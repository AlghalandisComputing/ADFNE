function [bhl, wts, colors, clys, flys] = FNMfromBorehole(fnm, p1, p2, s, r, m, c)
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

if nargin<7; c = [0.5, 0.5, 0.5]; end
if nargin<6; m = 64; end
if nargin<5; r = 0.05; end
Progress('FNMfromBorehole');
bhl = Borehole(r, m, p1, p2, -0.1);                         %Borehole
[~, wts, otl, lns, colors] = GetTraces3D(fnm, bhl);         %Traces
flys = GenPolysOnTraces3D(lns, otl, s, c);                  %Polys fitted on traces
clys = ClipPolys3D(flys);                                   %clipped
Progress('FNMfromBorehole', 1, 1);
