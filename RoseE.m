function [g, x, y] = RoseE(ags, nb, tl, color)
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

if nargin<4; color = [0, 0.5, 0.5]; end
if nargin<3; tl = 'Rose'; end
if nargin<2; nb = 36; end
h = rose(ags, nb);
title(tl);
x = h.XData;
y = h.YData;
g = patch(x, y, color);
