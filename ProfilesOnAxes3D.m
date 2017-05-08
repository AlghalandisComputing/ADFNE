function prfs = ProfilesOnAxes3D(nx, ny, nz, bbox)
% {name}
% {desc}
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

if (nargin<4) || isempty(bbox); bbox = [0, 0, 0; 1, 1, 1]; end
if nargin<3; nz = 4; end
if nargin<2; ny = 4; end
if nargin<1; nx = 4; end
x1 = bbox(1, 1);
y1 = bbox(1, 2);
z1 = bbox(1, 3);
x2 = bbox(2, 1);
y2 = bbox(2, 2);
z2 = bbox(2, 3);
prfX = [x1, y1, z1; x1, y2, z1; x1, y2, z2; x1, y1, z2];
prfY = [x1, y1, z1; x2, y1, z1; x2, y1, z2; x1, y1, z2];
prfZ = [x1, y1, z1; x2, y1, z1; x2, y2, z1; x1, y2, z1];
prfXs = cell(0);
if nx>0
    i = 0;
    for x=linspace(x1, x2, nx)
        prf = prfX;
        prf(:, 1) = x;
        i = i+1;
        prfXs{i} = prf;
    end
end
prfYs = cell(0);
if ny>0
    i = 0;
    for y=linspace(y1, y2, ny)
        prf = prfY;
        prf(:, 2) = y;
        i = i+1;
        prfYs{i} = prf;
    end
end
prfZs = cell(0);
if nz>0
    i = 0;
    for z=linspace(z1, z2, nz)
        prf = prfZ;
        prf(:, 3) = z;
        i = i+1;
        prfZs{i} = prf;
    end
end
prfs = {prfXs, prfYs, prfZs};
