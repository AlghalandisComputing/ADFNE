function ags = Angles2D(lns)
% Angles2D
% returns angles of 2D lines (fracture traces)
%
% Usage :
% ags = Angles2D(lns)
%
% input : lns       (n, 4)
% output: ags       (n) in radian
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

ags = atan2(lns(:, 4)-lns(:, 2), lns(:, 3)-lns(:, 1));
