function sup = Sup2D(x, y, w, h)
% Sup2D
% creates a support at point(x, y) with width(w) and height(h)
%
% Usage :
% sup = Sup2D(x, y, w, h)
%
% input : x, y      coordinates of the center of support
%         w, h      width and height
% output: sup       (4, 4),  a rectangle
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

sup = [[0, 0, w, 0];[w, 0, w, h];[w, h, 0, h];[0, h, 0, 0]];
sup(:, [1, 3]) = sup(:, [1, 3])+x-0.5*w;
sup(:, [2, 4]) = sup(:, [2, 4])+y-0.5*h;
