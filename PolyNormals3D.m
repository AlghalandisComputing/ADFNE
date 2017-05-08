function nrs = PolyNormals3D(plys)
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
nrs = zeros(n, 3);
for i=1:n
    nrs(i, :) = planeNormal(createPlane(plys{i}));
end
