function f = Rosef(x, nb)
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

if nargin<2; nb = 12; end
nb = nb+1;
b = linspace(0, 2*pi, nb)';
f = histc(x, b);
v = f(1)+f(end);
f(1) = v;
f(end) = v;
