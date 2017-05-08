function y = Scale(x, a, b, func)
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

if nargin<4; func = ''; end
if nargin<3; b = 1; end
if nargin<2; a = 0; end
x1 = nanmin(x(:));
x2 = nanmax(x(:));
y = x;
f = ~isnan(x);
y(f) = (x(f)-x1)/(x2-x1)*(b-a)+a;
if ~isempty(func)
    y(f) = func(y(f));
end
