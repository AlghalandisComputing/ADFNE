function [X, Y] = LinesToXYnan2D(lines)
% LinesToXYnan2D
% builds [X, Y, nan] from lines for `plot` to highest efficiency
%
% Usage :
% [X, Y] = LinesToXYnan2D(lines)
%
% input : lines     (n, 4)
% output: X         x coordinates of lines
%         Y         y coordinates of lines
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

n = size(lines, 1);
X = [lines(:, [1, 3]), NaN(n, 1)]';
Y = [lines(:, [2, 4]), NaN(n, 1)]';
