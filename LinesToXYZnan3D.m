function [X, Y, Z] = LinesToXYZnan3D(lines)
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

n = size(lines, 1);
X = [lines(:, [1, 4]), NaN(n, 1)]';
Y = [lines(:, [2, 5]), NaN(n, 1)]';
Z = [lines(:, [3, 6]), NaN(n, 1)]';
