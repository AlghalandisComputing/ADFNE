function Y = Vary(X, p)
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

if nargin<2; p = 0.1; end
if p~=0
    Y = X.*(1+((randi(2, size(X))-1)*2-1)*p);
else
    Y = X;
end
