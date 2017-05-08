function [nodes, edges] = BackboneToNodesEdges2D(bbn)
% BackboneToNodesEdges2D
% returns (nodes, edges) extracted from 2D backbone
%
% Usage :
% [nodes, edges] = BackboneToNodesEdges2D(bbn)
%
% input : bbn       backbone
% output:           nodes
%                   edges
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

nodes = dict();
edges = bbn;
for i=1:size(bbn, 1)
    p1 = bbn(i, 1:2);                                       %endpoints as keys for nodes
    p2 = bbn(i, 3:4);
    nodes(p1) = unique([nodes(p1), i]);                     %indices of edges associated with nodes
    nodes(p2) = unique([nodes(p2), i]);
end
