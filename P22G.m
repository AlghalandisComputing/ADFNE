function [p22, Ls, x, y] = P22G(lines, gn, gm)
% P22G
% evaluates P22 (fracture length per unit area) for 2D DFN
%
% Usage :
% [p22, Ls, x, y] = P22G(lines, gn, gm)
%
% input : lines     (n, 4)
%         gn        grid dimensions, horizontally
%         gm        grid dimensions, vertically
% output: tLs       (n) cell, total length
%         xLs       (n) cell, all lengths
%         carea     area of cell
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
Ls = zeros(gm, gn);
for i = 1:gm
    for j = 1:gn
        sup = [(j-1)*w, j*w, (i-1)*h, i*h];         %support e.g., rectangle
        cls = ClipLines2D(lines, sup);              %fractures inside the support
        lhs = Lengths2D(cls(sum(cls, 2)>0, :));     %lengths
        %Ls(i, j) = {lhs};                          %store all lengths
        Ls(i, j) = sum(lhs);                        %total length per cell
    end
end
x = [w/2, 1-w/2];
y = [h/2, 1-h/2];
p22 = mean(Ls(:)/carea);
