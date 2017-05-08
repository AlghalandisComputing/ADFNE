function P10 = P10fromP32(plys, lne, P32)
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

alpha = AngleSamplePolyNormal3D(plys, lne);
pd = fitdist(alpha, 'normal');
ags = linspace(0, pi, 180);
P10 = P32*sum(abs(cos(ags)).*pdf(pd, ags));
