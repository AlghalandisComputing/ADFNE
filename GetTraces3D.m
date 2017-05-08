function [lts, wts, otl, lns, colors] = GetTraces3D(fnm, bhls)
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

Progress('GetTraces3D');
[xts, ids] = PolysXPolys3DE(fnm, bhls);
[lts, wts, otl, lns] = ConnectSegments3D(xts, ids);
colors = rand(length(lts), 3);
Progress('GetTraces3D', 1, 1);
