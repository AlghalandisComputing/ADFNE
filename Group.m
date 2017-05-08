function [gxs, gds] = Group(xts, ids, n)
% Group
% groups intersection indices and points
%
% Usage :
% [gxs, gds] = Group(xts, ids, n)
%
% input : xts       intersection points (m, 2)
%         ids       intersection indices (m, 2)
%         n         number of fractures
% output: gxs,gds   (n) cell
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

gds = cell(n, 1);
gxs = cell(n, 1);
for i=1:size(ids, 1)
    I = ids(i, 1);
    J = ids(i, 2);
    gds{I} = [gds{I}, J];
    gds{J} = [gds{J}, I];
    gxs{I} = [gxs{I};xts(i, :)];
    gxs{J} = [gxs{J};xts(i, :)];
end
