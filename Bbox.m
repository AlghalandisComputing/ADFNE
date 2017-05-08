function [bbox,x,y,z] = Bbox(pts)
% find bounding box of 3D points
%
% Usage :
% [bbox,x,y,z] = Bbox(pts)
%
% input : pts       (n, m)
% output: x         (n)
%         y         (n)
%         z         (n)
%         bbox      (2, 3) corners
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

x = pts(:, 1);
y = pts(:, 2);
z = pts(:, 3);
x1 = min(x);
x2 = max(x);
y1 = min(y);
y2 = max(y);
z1 = min(z);
z2 = max(z);
bbox = [x1,y1,z1; x2,y2,z2];
