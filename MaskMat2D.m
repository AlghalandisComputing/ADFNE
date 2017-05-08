function B = MaskMat2D(A, rgn)
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

[m, n] = size(A);
[x, y] = meshgrid(1:n, 1:m);
B = A;
b = inpolygon(x, y, rgn(:, 1), rgn(:, 2));
B(~b) = nan;
