function szs = Size3D(plys)
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

n = length(plys);
szs = zeros(n, 1);
for i=1:n
    szs(i) = 2*mean(CentralRays3D(plys{i}));
end
