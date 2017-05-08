function [p21, ns, x, y] = P21G(lines, gn, gm)
% P21G
% evaluates P21 (number of fractures in unit area) 2D DFN
%
% Usage :
% [p21, ns, x, y] = P21G(lines, gn, gm)
%
% input : lines     (n, 4)
%         gn        grid dimensions,  horizontally
%         gm        grid dimensions,  vertically
% output: p21       average p21 measure
%         ns        p21 number for all cells
%         x, y      extent for plotting
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3
    gn = 25;
    gm = gn;
end
w = 1/gn;                                           %cell width
h = 1/gm;                                           %cell height
carea = w*h;                                        %cell area
ns = zeros(gm, gn);
for i = 1:gm
    for j = 1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];         %support e.g.,  rectangle
        cls = ClipLines2D(lines, sup);              %fractures inside the support
        ns(i, j) = size(cls, 1);                    %number of fractures inside the support
    end
end
x = [w/2, 1-w/2];
y = [h/2, 1-h/2];
p21 = mean(ns(:)/carea);
