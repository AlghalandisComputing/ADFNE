function [I, J] = PDistIndices(n)
% PDistIndices
% finds indices of results from `pdist` function
%
% Usage :
% [I, J] = PDistIndices(n)
%
% input : n         number of points
% output: I, J      indices
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[I, J] = find(tril(ones(n), -1));
