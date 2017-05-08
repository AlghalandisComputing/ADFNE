function D = GDensity3D(pts, n, s, R)
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

if nargin<4; R = [0, 1, 0, 1, 0, 1]; end
if nargin<3; s = 25; end
if nargin<2; n = 19; end
D = zeros(s, s, s);
for i=1:2:n
    D = D+Resize3D(Count3D(pts, [i, i, i], R), s, s, s);
end
