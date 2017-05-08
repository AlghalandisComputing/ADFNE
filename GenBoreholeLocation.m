function [P1, P2] = GenBoreholeLocation(r, h)
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

if nargin<2; h = 1; end
if nargin<1; r = 0.15; end
[X, Y] = RandCV2D(0, r);                                    % location of boreholes
P1 = [X', Y', zeros(length(X), 1)];                         % bottom location
P2 = P1;
P2(:, 3) = h;                                               % top location
