function C = SupCSup2D(lines, La, sup1, sup2)
% SupCSup2D
% test for connectivity between two 2D supports via fracture network
%
% Usage :
% C = SupCSup2D(lines, La, sup1, sup2)
%
% input : lines     (n, 4), fracture network
%         La        (n) cluster labels for lines
%         sup1      support 1, box, e.g., [0, 1, 0, 1]
%         sup2      support 2
% output: C         true/false
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

xC1 = SupXLines2D(sup1, lines, La);             %cluster info of sup1 from fnm
xC2 = SupXLines2D(sup2, lines, La);             %cluster info of sup2 from fnm
C = ~isempty(intersect(xC1, xC2));              %if they intersect?
