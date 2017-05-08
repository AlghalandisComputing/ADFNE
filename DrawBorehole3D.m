function DrawBorehole3D(p0, p1, r, m, ec, fc, fa, lt)
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

if nargin<8; ls = ':'; end
if nargin<7; fa = 0.5; end
if nargin<6; fc = [1, 0, 0]; end
if nargin<5; ec = [0, 0, 1]; end
if nargin<4; m = 32; end
if nargin<3; r = 0.05; end
DrawCircle3D(p0, r, m, [0, 0, 0], fc, 0.5);
DrawCircle3D(p1, r, m, [0, 0, 0], fc, 0.5);
[X, Y, Z] = cylinder2P(r, m+1, p0, p1);
h = surf(X, Y, Z);
h.EdgeColor = ec;
h.FaceColor = fc;
h.FaceAlpha = fa;
h.LineStyle = lt;
