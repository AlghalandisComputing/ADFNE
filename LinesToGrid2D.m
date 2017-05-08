function [gx, gy] = LinesToGrid2D(lns, nx, ny)
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

[x1, x2] = MinMax(lns(:, [1, 3]));
gx = linspace(x1, x2, nx+1);
[y1, y2] = MinMax(lns(:, [2, 4]));
gy = linspace(y1, y2, ny+1);
