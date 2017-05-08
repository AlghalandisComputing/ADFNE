function y = RandBetween(shape, a, b)
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

if nargin<3; b = 1; end
if nargin<2; a = 0; end
if nargin<1; shape = 1; end
x = rand(shape);
if (a==0) && (b==1)
    y = x;
else
    y = ScaleE(x, 0, 1, a, b);
end
