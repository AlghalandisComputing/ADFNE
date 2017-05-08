function oly = Translate3D(ply, mov)
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

oly = [ply(:, 1)+mov(1),  ply(:, 2)+mov(2),  ply(:, 3)+mov(3)];
