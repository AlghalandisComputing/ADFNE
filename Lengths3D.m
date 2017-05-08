function lhs = Lengths3D(lines)
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

if isempty(lines)
    lhs = 0;
else
    lhs = sqrt(sum((lines(:, [4, 5, 6])-lines(:, [1, 2, 3])).^2, 2));
end
