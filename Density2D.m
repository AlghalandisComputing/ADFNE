function [DN, x, y] = Density2D(lines, gm, gn)
% Density2D
% computes true density of 2D fracture network
%
% Usage :
% [DN, x, y] = Density2D(lines, gm, gn)
%
% input : lines     (n, 4)
%         gm        grid dimension vertically
%         gn        grid dimension horizontally
% output: DN        (gm, gn)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

w = 1/gn;                                               %sampling cell's width
h = 1/gm;                                               %sampling cell's height
DN = zeros(gm, gn);
for i = 1:gm
    for j = 1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];
        DN(i, j) = SupXNLines2D(sup, lines);
    end
end
x = [w/2, 1-w/2];                                       %for usage in imagesc(x, y, DN)
y = [h/2, 1-h/2];
