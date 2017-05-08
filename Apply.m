function res = Apply(func, X)
% Apply
% applies given function func to variable X
%
% Usage :
% res = Apply(func, X)
%
% input : func      any function such as 'mean', 'min' etc
%         X         data
% output: res       {...}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

res = func(X(:));
