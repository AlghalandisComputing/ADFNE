function olins = BreakLinesX2D(lines)
% BreakLinesX2D
% breaks 2D lines at their intersection points
%
% Usage :
% olins = BreakLinesX2D(lines)
%
% input : lines     (n, 4)
% output: olins     cell
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[xts, ids, ~] = LinesX2D(lines);
gxs = Group(xts, ids, size(lines, 1));
n = size(gxs, 1);
olins = cell(n, 1);
for i=1:n
    ots = SortPoints2D([gxs{i}; lines(i, 1:2); lines(i, 3:4)]);
    olins{i} = [ots(1:end-1, :), ots(2:end, :)];
end
