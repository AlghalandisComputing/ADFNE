function [x, y] = LinesFitGridXY2D(lns, m, n)
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

[x1, y1, x2, y2] = BBoxLines2D(lns);
gx = linspace(x1, x2, n+1);
gy = linspace(y1, y2, m+1);
x = gx(1:end-1)+0.5*(gx(2)-gx(1));
y = gy(1:end-1)+0.5*(gy(2)-gy(1));
