function [p1, p2] = FarthestPoints(pts)
% FarthestPoints
% finds two farthest points in a set of nD points
%
% Usage :
% [p1, p2] = FarthestPoints(pts)
%
% input : pts       (n, 2)
% output: p1, p2    two farthest points
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[~, idx] = max(pdist(pts, 'euclidean'));
[I, J] = PDistIndices(size(pts, 1));
p1 = pts(I(idx), :);
p2 = pts(J(idx), :);
