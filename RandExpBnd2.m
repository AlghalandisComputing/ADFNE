function x = RandExpBnd2(shape, mu, a, b)
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

if nargin<4; b = 1; end
if nargin<3; a = 0; end
if nargin<2; mu = 0.5; end
if nargin<1; shape = 1; end
if numel(shape)==1; shape = [shape, 1]; end
a = exp(-a/mu); 
b = exp(-b/mu);
x = -mu.*log(a+(b-a).*rand(shape));
