function [ds, dds] = Orientation3D(plys)
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
ds = zeros(n, 1);
dds = zeros(n, 1);
for i=1:n
    ply = plys{i};
    pln = createPlane(ply);
    nrm = planeNormal(pln);
    dds(i) = atan2(nrm(2), nrm(1));
    ds(i) = -asin(nrm(3));
end
