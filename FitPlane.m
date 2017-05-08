function [C, ots] = FitPlane(pts, draw)
% {name}
% {desc} z = x*C(1)+y*C(2)+C(3);
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

C = planefit(pts(:, 1), pts(:, 2), pts(:, 3));
Z = C(1)*pts(:, 1)+C(2)*pts(:, 2)+C(3);
ots = pts;
ots(:, 3) = ots(:, 3)-Z;              %detrended points
if draw
    bbox = Bbox(pts);
    x = [bbox(1, 1) bbox(2, 1) bbox(2, 1) bbox(1, 1) bbox(1, 1)];
    y = [bbox(1, 2) bbox(1, 2) bbox(2, 2) bbox(2, 2) bbox(1, 2)];
    z = C(1)*x+C(2)*y+C(3);
    hold on
    fill3(x, y, z, 'y');
end
