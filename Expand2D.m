function Y = Expand2D(X, nx, ny)
% Expand2D
% expands a 2D matrix by nx, ny
%
% Usage :
% Y = Expand2D(X, nx, ny)
%
% input : X         2D matrix
%         nx, ny    increase in dimensions
% output: Y         expanded matrix
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin==1; nx = 1; ny = 1; end
[m, n] = size(X);
Y = zeros(m+ny, n+nx)+X(end, end);
Y(1:m, 1:n) = X;
