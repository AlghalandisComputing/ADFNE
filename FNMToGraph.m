function [G, cm] = FNMToGraph(ids, n, fnm)
% FNMToGraph
% creates Graph from fracture network
%
% Usage :
% [G, cm] = FNMToGraph(ids, n, fnm)
%
% input : ids       intersection indices
%         n         number of fractures
%         fnm       fracture network 2D or 3D
% output: G         Graph
%         cm        connectivity matrix
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin==3
    if iscell(fnm)
        [~, ids, ~] = PolysX3D(fnm);                    %3D fracture network
    else
        [~, ids, ~] = LinesX2D(fnm);                    %2D fracture network
    end
    if isempty(ids); G = empty; return; end
    n = size(fnm, 1);
end
cm = ConnectivityMatrix(ids, n, false, false);
G = biograph(cm, num2str(linspace(1, n, n)'));
