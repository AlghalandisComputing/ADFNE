function DrawCircle3D(cnt, r, n, ec, fc, fa)
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

if nargin<6; fa = 0.5; end
if nargin<5; fc = [0, 0, 1]; end
if nargin<4; ec = [0, 0, 0]; end
if nargin<3; n = 24; end
if nargin<2; r = 0.1; end
if nargin<1; cnt = [0, 0, 0]; end
ags = linspace(0, 2*pi, n+1);
ags = ags(1:end-1);
y = r*cos(ags);
z = r*sin(ags);
ply = Translate3D(PolyToDipDir3D([zeros(n, 1), y', z'], 0, 0), cnt);
patch(ply(:, 1), ply(:, 2), ply(:, 3), fc, 'FaceAlpha', fa, 'EdgeColor', ec);
