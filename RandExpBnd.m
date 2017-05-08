function x = RandExpBnd(shape, mu, a, b)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : shape     sample dimensions
%         mu        mean of exponential distribution
%         a         lower bound
%         b         upper bound
% output: x         {}
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
L = expcdf(a, mu);
U = expcdf(b, mu);
sam = L+(U-L).*rand(shape);
x = expinv(sam, mu);
