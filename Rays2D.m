function lns = Rays2D(cnt, ags, lhs)
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

if nargin<1; cnt = [0, 0]; end
if nargin<2;
    ags = linspace(0, 2*pi, 37);
    ags = ags(1:end-1);
end
n = numel(ags);
if nargin<3; lhs = ones(1, n); end
lns = zeros(n, 4);
for i=1:n
    [x, y] = pol2cart(ags(i), lhs(i));
    lns(i, :) = [cnt, cnt+[x, y]];
end
