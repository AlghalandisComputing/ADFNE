function [sx, sy, X, Y, x, y] = MatchFNMtoCF2D(fnm, m, n, u)
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

if nargin<4; u = 1; end
[X, Y] = LinesToXYnan2D(fnm);                 %plot(X, Y, '-');
[x, y] = LinesFitGridXY2D(fnm, m, n);              
sx = linspace(x(1), x(end), numel(x)*u);      %e.g., contourf(sx, sy, Scale(imresize(GCF, u)));
sy = linspace(y(1), y(end), numel(y)*u);
