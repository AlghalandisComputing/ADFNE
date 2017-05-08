function B = IsolatedLines2D(lines, tol)
% IsolatedLines2D
% check isolation for all 2D fracture lines
%
% Usage :
% B = IsolatedLines2D(lines, tol)
%
% input : lines     (n, 4)
%         tol
% output: B         (n) Boolean
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; tol = 1e-9; end
p1s = lines(:, 1:2);
p2s = lines(:, 3:4);
pts = [p1s;p2s];
n = size(lines, 1);
B = false(n, 1);
for i=1:n
    B(i) = (Occurrence(p1s(i, :), pts, tol)<=1) | (Occurrence(p2s(i, :), pts, tol)<=1);
end
