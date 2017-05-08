function [x1,y1,x2,y2] = BBoxLines2D(lns)
% BBoxLines2D
% returns Bbox for 2D lines
%
% Usage :
% [x1,y1,x2,y2] = BBoxLines2D(lns)
%
% input : lns       (n, 4)
% output: x1,y1,x2,y2 corners       
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[x1,x2] = MinMax(lns(:, [1,3]));
[y1,y2] = MinMax(lns(:, [2,4]));
