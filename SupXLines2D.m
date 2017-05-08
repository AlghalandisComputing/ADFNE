function [C, n] = SupXLines2D(sup, lns, La)
% SupXLines2D
% find cluster labels for a support intersecting 2D fracture network
%
% Usage :
% [C, n] = SupXLines2D(sup, lns, La)
%
% input : sup       (4), e.g., [0, 1, 0, 1]
%         lines     (n, 4)
%         La        cluster labels of fractures
% output: C         intersected clusters
%         n         number of clipped lines
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

cls = ClipLines2D(lns, sup);
msk = ~all(cls==0, 2);                      %validate resulting lines
n = sum(msk);                               %number of valid clipped lines
C = unique(La(msk));                        %clusters for clipped lines
