function ply = GenPoly3D(s, c)
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

if nargin<2; c = [0.5, 0.5, 0.5]; end
if nargin<1; s = 1; end
if isempty(c);
    c = [0.5, 0.5, 0.5];
    ply = [0, -0.5, -0.5; 0, 0.5, -0.5; 0, 0.5, 0.5; 0, -0.5, 0.5];
else
    ply = [0, rand-0.5, -0.5; 0, 0.5, rand-0.5; 0, rand-0.5, 0.5; 0, -0.5, rand-0.5];
end
if s>0
    T = composeTransforms3d(...
        createRotationOy(-pi/2+ScaleE(rand, 0, 1, 0, pi/2)), ...
        createRotationOz(ScaleE(rand, 0, 1, 0, 2*pi)), ...
        createScaling3d(s, s, s), ...
        createTranslation3d(c));
    ply = transformPoint3d(ply, T);
end
