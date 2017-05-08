function DrawOrigin3D(r, pt, lw)
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

if nargin<3; lw = 2; end
if nargin<2; pt = [0, 0, 0]; end
if nargin<1; r = 1; end
x = pt(1);
y = pt(2);
z = pt(3);
DrawLines3D([-r+x, 0+y, 0+z, r+x, 0+y, 0+z], 'r-', lw);
DrawLines3D([0+x, -r+y, 0+z, 0+x, r+y, 0+z], 'g-', lw);
DrawLines3D([0+x, 0+y, -r+z, 0+x, 0+y, r+z], 'b-', lw);
