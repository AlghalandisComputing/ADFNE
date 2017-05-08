function DrawCube3D(cnt, whd, color)
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

x = cnt(1);
y = cnt(2);
z = cnt(3);
w = 0.5*whd(1);             %X
h = 0.5*whd(2);             %Y
d = 0.5*whd(3);             %Z
vts = [x-w, y-h, z-d; x-w, y+h, z-d; x+w, y+h, z-d; x+w, y-h, z-d;...
       x-w, y-h, z+d; x-w, y+h, z+d; x+w, y+h, z+d; x+w, y-h, z+d];
fcs = [1, 2, 3, 4;2, 6, 7, 3;4, 3, 7, 8;1, 5, 8, 4;1, 2, 6, 5;5, 6, 7, 8];
patch('Faces', fcs, 'Vertices', vts, 'FaceColor', color, 'EdgeColor', 'none');
