function DrawLines3D(lines, attr, lw)
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

if nargin<3; lw = 1; end
if nargin<2; attr = '-'; end
n = size(lines, 1);
X = [lines(:, [1, 4]), nan(n, 1)]';
Y = [lines(:, [2, 5]), nan(n, 1)]';
Z = [lines(:, [3, 6]), nan(n, 1)]';
plot3(X, Y, Z, attr, 'LineWidth', lw);
