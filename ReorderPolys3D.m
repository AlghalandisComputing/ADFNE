function olys = ReorderPolys3D(plys)
% {name}
% reorders polygons to have positive normal vectors
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

nrms = PolyNormals3D(plys);
b = (nrms(:, 3)<0);
olys = plys;
for i=1:length(plys)
    if b(i)
        olys{i} = circshift(flipud(plys{i}), 1);
    end
end
