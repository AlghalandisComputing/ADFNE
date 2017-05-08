function lines = RandLinesInPoly2D(n, h, dh, ang, da, ply)
% RandLinesInPoly2D
% generates random 2D sampling lines inside a 2D polygon
%
% Usage :
% lines = RandLinesInPoly2D(n, h, dh, ang, da, ply)
%
% input : n         number of lines
%         h         length of lines
%         dh        length's tolerance
%         ang       angle
%         da        angle tolerance
%         ply      (k, 2)
% output: lines     (n, 4)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<6; ply = [[0, 0];[1, 0];[1, 1];[0, 1]]; end %default: unit square
if nargin<5; da = 0; end
if nargin<4; ang = 0; end
if nargin<3; dh = 0; end
if nargin<2; h = 0.1; end
if nargin<1; n = 100; end
px = ply(:, 1);
py = ply(:, 2);
xx = minmax(px');
yy = minmax(py');
lines = zeros(n, 4);
i = 0;
while i<n
    x1 = ScaleE(rand(1, 1), 0, 1, xx(1), xx(2));
    y1 = ScaleE(rand(1, 1), 0, 1, yy(1), yy(2));
    rr = (2*rand(1, 2)-1);
    [dx, dy] = pol2cart(ang+rr(1)*da, h+rr(2)*dh);
    x2 = x1+dx;
    y2 = y1+dy;
    if inpolygon([x1, x2], [y1, y2], px, py) %if line is inside the polygon
        i = i+1;
        lines(i, :) = [x1, y1, x2, y2];
    end
end
