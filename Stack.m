function S = Stack(C)
% Stack
% stacks values of cell, i.e., results in array
%
% Usage :
% S = Stack(C)
%
% input : C         cell
% output: S         array
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if isempty(C)
    S = [];
else
    S = cat(1, C{:});
end
