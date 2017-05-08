function rays = CentralRays3D(ply)
% CentralRays3D
% {desc}
%
% Usage :
% rays = CentralRays3D(ply)
%
% input : ply       (n, 3)
% output: rays      {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

cnt = mean(ply, 1);
n = size(ply, 1);
rays = sqrt(sum((ply-repmat(cnt, n, 1)).^2, 2));
