function DFN = FNMfromBoreholes(fnm, P1, P2, s, r, m, c)
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

n = size(P1, 1);
DFN = [];
for i=1:n
    [~, ~, ~, dfn, ~] = FNMfromBorehole(fnm, P1(i, :), P2(i, :), s, r, m, c);
    DFN = [DFN; dfn];
end
