function lns = PolyNormalLines3D(plys, s)
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

if nargin<2; s =1; end
cts = Centroids3D(plys);
nrs = PolyNormals3D(plys)*s;
lns = [cts, cts+nrs];
