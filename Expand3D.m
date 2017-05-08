function Y = Expand3D(X, nx, ny, nz)
% Expand3D
% expands a 3D matrix by nx, ny, nz
%
% Usage :
% Y = Expand3D(X, nx, ny, nz)
%
% input : X         3D matrix
%         nx, ny, nz increase in dimensions
% output: Y         expanded matrix
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin==1; nx = 1; ny = 1; nz = 1; end
[m, n, o] = size(X);
Y = zeros(m+ny, n+nx, o+nz)+X(end, end, end);
Y(1:m, 1:n, 1:o) = X;
