function [X, Y] = RandCV2D(n, r)
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

if nargin<2; r = 0.1; end
if nargin<1; n = 100; end
if r==0; r = ((1-2*r)^2)/(2*n); end
if n==0; n = 1e10; end 
m = min(round(2*((1-2*r)^2)/(pi*r^2)), n);
X = ScaleE(rand, 0, 1, r, 1-r);
Y = ScaleE(rand, 0, 1, r, 1-r);
i = 0;
while i<m
    x = ScaleE(rand, 0, 1, r, 1-r);
    y = ScaleE(rand, 0, 1, r, 1-r);
    d = pdist2([x, y], [X', Y']);
    if all(d>=r)
        X = [X, x];
        Y = [Y, y];
        i = i+1;
    end
end
