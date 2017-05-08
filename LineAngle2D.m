function ags = LineAngle2D(lines)
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

dx = lines(:, 3)-lines(:, 1);
dy = lines(:, 4)-lines(:, 2);
ags = atan2(dy, dx);
b = ags<0;
if sum(b)>0
    ags(b) = ags(b)+2*pi;
end
