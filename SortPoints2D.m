function ots = SortPoints2D(pts)
% SortPoints2D
% sorts 2D points topologically
%
% Usage:
% ots = SortPoints2D(pts)
%
% input : pts       (n, 2)
% output: ots       (n, 2)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

p1 = FarthestPoints(pts);                       %farthest point as ref
d = pdist2(pts, p1);
[~, idx] = sort(d);
ots = pts(idx, :);
