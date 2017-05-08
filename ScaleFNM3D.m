function olys = ScaleFNM3D(plys, S)
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
if numel(S)==1; S = zeros(n, 1)+S; end
olys = plys;
for i=1:n
    T = composeTransforms3d(...
        createScaling3d(S(i), S(i), S(i)));
    olys{i} = transformPoint3d(plys{i}, T);
end
cts = Centroids3D(plys);
ots = Centroids3D(olys);
for i=1:n
    mov = cts(i, :)-ots(i, :);
    olys{i} = Translate3D(olys{i}, mov);
end
