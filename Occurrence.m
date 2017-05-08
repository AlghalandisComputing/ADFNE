function k = Occurrence(pt, pts, tol)
% Occurrence
% finds number of occurrence of a point in set of nD points
%
% Usage :
% k = Occurrence(pt, pts, tol)
%
% input : pt        point
%         pts       points
%         tol       tolerance of distance
% output: k         occurrence number
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; tol = 1e-9; end
[m, n] = size(pts);
k = true(m, 1);
if tol~=0
    for i=1:n
        k = k & (abs(pts(:, i)-pt(i))<tol);         %relative match
    end
else
    for i=1:n
        k = k & (pts(:, i)==pt(i));                 %absolute match
    end
end
k = sum(k);
