function x = RandUniBnd(shape, a, b)
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
if numel(shape)==1; shape = [shape, 1]; end
x = ScaleE(rand(shape), 0, 1, a, b);
