function P21 = P21fromP32(plys, nrm, P32)
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

beta = AngleSamplePolyNormal3D(plys, nrm);
pd = fitdist(beta, 'normal');
ags = linspace(0, pi, 180);
P21 = P32*sum(abs(sin(ags)).*pdf(pd, ags));
