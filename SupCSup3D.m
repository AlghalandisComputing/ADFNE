function out = SupCSup3D(sup1, sup2, plys, La)
% SupCSup3D
% checks if two 3D suports are connected
%
% Usage :
% out = SupCSup3D(sup1, sup2, plys, La)
%
% input : sup1      cell of polygons
%         sup2      cell of polygons
%         plys      cell of polygons
%         La        cluster labels
% output: out       Boolean
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[~, ~, ids1] = PolysXPolys3D(sup1, plys);           %fractures intersection indices
[~, ~, ids2] = PolysXPolys3D(sup2, plys);
if isempty(ids1) || isempty(ids2)
    out = false;
else
    out = ~isempty(intersect(La(ids1), La(ids2)));
end
