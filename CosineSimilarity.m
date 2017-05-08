function csim = CosineSimilarity(u,v)
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

su = sqrt(sum(u.^2));
sv = sqrt(sum(v.^2));
csim = abs((u*v')/(su*sv'));
