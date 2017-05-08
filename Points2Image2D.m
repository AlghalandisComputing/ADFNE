function [img, ix, iy] = Points2Image2D(pts)
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

X = pts(:, 1)';
Y = pts(:, 2)';
C = pts(:, 3)';
nx = size(unique(X), 2);
ny = size(unique(Y), 2);
img = zeros(ny, nx);
ix = round(Scale(X, 1, nx));
iy = round(Scale(Y, 1, ny));
for i=1:size(ix, 2)
    img(iy(i), ix(i)) = C(i);
end
