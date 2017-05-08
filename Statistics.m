function [n, m, s, sk, kr, q] = Statistics(x)
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

y = x(:);
n = size(y, 1);
m = mean(y);
s = std(y);
sk = skewness(y);
kr = kurtosis(y);
q = quantile(y, [0.25, 0.5, 0.75]);
