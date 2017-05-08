function cts = Centers2D(lines)
% Centers2D
% returns center points of 2D fracture lines
%
% Usage :
% cts = Centers2D(lines)
%
% input : lines     (n, 4)
% output: cts       (n, 2)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

cts = 0.5*[lines(:, 3)+lines(:, 1), lines(:, 4)+lines(:, 2)];
