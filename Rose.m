function f = Rose(x, nb, tl, attr)
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

if nargin<4; attr = {'o-', 'r', 3}; end
if nargin<3; tl = 'Rose'; end
if nargin<2; nb = 12; end
nb = nb+1;
b = linspace(0, 2*pi, nb)';
f = histc(x, b);
v = f(1)+f(end);
f(1) = v;
f(end) = v;
h = polar(b, f, attr{1});
set(h, 'Color', attr{2});
set(h, 'LineWidth', attr{3});
title(tl);
