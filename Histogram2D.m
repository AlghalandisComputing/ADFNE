function out = Histogram2D(pts, nx, ny)
% Histogram2D
% computes 2D histogram (~density) of points
%
% Usage :
% out = Histogram2D(pts, nx, ny)
%
% input : pts       (n, 2)
%         nx        grid dimension on axis X
%         ny        grid dimension on axis Y
% output: out       (ny, nx)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3
    nx = 7;                                         %default grid size
    ny = 7;
end
k = [nx, ny];
bin = zeros(size(pts));
for i = 1:2                                         %iterate for X and Y coordinates
    minx = min(pts(:, i));
    egs = minx+((max(pts(:, i))-minx)/k(i))*(0:k(i));
    [~, t] = histc(pts(:, i), [-Inf, egs(2:end-1), Inf], 1);
    bin(:, i) = min(t, k(i));
end
out = accumarray(bin(all(bin>0, 2), :), 1, k)';
