function clns = ClipLines2DE(lns, bx)
% ClipLines2DE
% {desc}
%
% Usage :
% clns = ClipLines2DE(lns, bx)
%
% input : lns       (n, 4)
%         bx        (4)
% output: clns      (m, 4)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; bx = [0, 1, 0, 1]; end
[m, n] = size(lns);
clns = zeros(m, n);
for i = 1:m
    clns(i, :) = clipEdgeE(lns(i, :), bx, 9);
end
clns = clns(~all(clns==0, 2), :);
