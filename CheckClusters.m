function OK = CheckClusters(C)
% CheckClusters
% checks if clusters are OK, have no missing common element
%
% Usage :
% OK = CheckClusters(C)
%
% input : C         cell
% output: OK        boolean
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

X = horzcat(C{:});
OK = (length(unique(X))==length(X));
