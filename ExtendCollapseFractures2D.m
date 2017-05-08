function ols = ExtendCollapseFractures2D(lns, r)
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

if nargin<2; r = [0.1, 0.1]; end
if all(r==0)
    ols = lns;
else
    p1s = lns(:, 1:2);
    p2s = lns(:, 3:4);
    dts = p2s-p1s;
    n = size(dts, 1);
    r1 = RandBetween([n, 1], 1-r(1), 1+r(2));
    r2 = RandBetween([n, 1], 1-r(1), 1+r(2));
    ols = [p2s-dts.*[r1, r1], p1s+dts.*[r2, r2]];
end
