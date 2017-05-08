function b = Isolated2D(i, lines, tol)
% Isolated2D
% checks if a line at index i from lines is isolated
%
% Usage :
% b = Isolated2D(i, lines, tol)
%
% input : i         index
%         lines     (n, 4)
%         tol       tolerance, default=1e-9
% output: b         Boolean
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; tol = 1e-9; end
p1s = lines(:, 1:2);
p2s = lines(:, 3:4);
pts = [p1s;p2s];
b = (Occurrence(p1s(i, :), pts, tol)<=1) | (Occurrence(p2s(i, :), pts, tol)<=1);
