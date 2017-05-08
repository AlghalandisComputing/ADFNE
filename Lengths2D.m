function lhs = Lengths2D(lines)
% Lengths2D
% returns lengths of 2D fracture lines
%
% Usage :
% lhs = Lengths2D(lines)
%
% input : lines     (n, 4)
% output: lhs       (n)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if isempty(lines)
    lhs = 0;
else
    lhs = hypot(lines(:, 3)-lines(:, 1), lines(:, 4)-lines(:, 2));
end
