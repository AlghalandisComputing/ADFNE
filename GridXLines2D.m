function [C, Cn, Ln, gx, gy] = GridXLines2D(lns, La, nx, ny)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : nx        (1):nx, (n):gx
%         ny        (1):ny, (n):gy
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; ny = 7; end
if nargin<3; nx = 7; end
if (nargin<2)||isempty(La); La = LinesToClusters2D(lns); end
if numel(nx)==1
    [x1, x2] = MinMax(lns(:, [1, 3]));
    gx = linspace(x1, x2, nx+1);
else
    gx = nx;
    nx = numel(gx)-1;
end
if numel(ny)==1
    [y1, y2] = MinMax(lns(:, [2, 4]));
    gy = linspace(y1, y2, ny+1);
else
    gy = ny;
    ny = numel(gy)-1;
end
C = cell(ny, nx);
Ln = zeros(ny, nx);                                  %number of clipped lines
for i=1:ny
    for j=1:nx
        cel = [gx(j), gx(j+1), gy(i), gy(i+1)];
        [c, n] = SupXLines2D(cel, lns, La);
        C(i, j) = {c};
        Ln(i, j) = n;
    end
end
Cn = cellfun(@numel, C);                             %number of clusters
