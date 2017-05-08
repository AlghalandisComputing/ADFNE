function DrawMesh3D(v1, v2, w)
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

x1 = min(v1(:));
x2 = max(v1(:));
y1 = min(v2(:));
y2 = max(v2(:));
[gx, gy] = meshgrid(linspace(x1, x2, 70), linspace(y1, y2, 70));
gz = griddata(v1, v2, w, gx, gy);
mesh(gx, gy, gz);
daspect([1, 1, 1]);
camproj('perspective');
axis vis3d;
box on;
grid on;
