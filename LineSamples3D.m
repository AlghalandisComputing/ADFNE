function lines = LineSamples3D(N, h, dh)
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

if nargin<3; dh = 0; end
if nargin<2; h = 0.5; end
if nargin<1; N = [100, 100, 100]; end

if N(1)>0
    Z = rand(N(1), 1);
    setX = RandLinesInPoly2D(N(1), h, dh, 0, 0);
    setX = [[setX(:, [1, 2]), Z], [setX(:, [3, 4]), Z]];    %on X
else
    setX = [];
end
if N(2)>0
    Z = rand(N(2), 1);
    setY = RandLinesInPoly2D(N(2), h, dh, 0, 0);
    setY = [[setY(:, [2, 1]), Z], [setY(:, [4, 3]), Z]];    %on Y
else
    setY = [];
end
if N(3)>0
    Z = rand(N(3), 1);
    setZ = RandLinesInPoly2D(N(3), h, dh, 0, 0);
    setZ = [[Z, setZ(:, [2, 1])], [Z, setZ(:, [4, 3])]];    %on Z
else
    setZ = [];
end
lines = [setX;setY;setZ];
