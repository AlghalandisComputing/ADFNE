function [x1, m, x2, s, n] = Stats(x)
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
x1 = min(y);
x2 = max(y);
m = mean(y);
s = std(y);
n = length(y);
fprintf('n   : %g\nmin : %g\nmean: %g\nmax : %g\nstd : %g\n', n, x1, m, x2, s);
