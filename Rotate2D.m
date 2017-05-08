function ots = Rotate2D(pts, cnt, ang)
% Rotate2D
% rotates 2D points about a center by given angle
%
% Usage :
% ots = Rotate2D(pts, cnt, ang)
%
% input : pts       (n, 2)
%         cnt       center of rotation (2)
%         ang       angle of rotation
% output: ots       (n, 2)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; ang = 0; end
if nargin<2; cnt = [0, 0]; end
ots = [pts(:, 1)-cnt(1), pts(:, 2)-cnt(2)]*[cos(ang), sin(ang);-sin(ang), cos(ang)];
ots = [ots(:, 1)+cnt(1), ots(:, 2)+cnt(2)];
