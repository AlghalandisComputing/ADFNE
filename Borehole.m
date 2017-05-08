function plys = Borehole(r, m, p1, p2, draw)
% Borehole
% creates a cylinder with m sides from p1 to p2 
%
% Usage :
% plys = Borehole(r, m, p1, p2, draw)
%
% input : r         radius
%         m         number of sides
%         p1        start point
%         p2        end point
%         draw      if true to draw the borehole
% output: plys      all sides of created cylinder
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[X,Y,Z] = cylinder2P(r, m+1, p1, p2);
plys = cell(0);
for i=1:m
    plys{i} = [X(1,i), X(1,i+1), X(2,i+1), X(2,i);...
               Y(1,i), Y(1,i+1), Y(2,i+1), Y(2,i);...
               Z(1,i), Z(1,i+1), Z(2,i+1), Z(2,i)]';
end
plys = plys';
if draw>=0
    n = length(Z);
    if draw>0
        C = repmat(draw, 1, n);
    else
        C = linspace(1, n, n);
    end
    surf(X, Y, Z, C);
end
