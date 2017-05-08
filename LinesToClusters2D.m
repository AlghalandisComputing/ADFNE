function La = LinesToClusters2D(lines)
% LinesToClusters2D
% finds clusters of 2D fracture lines (inter-connections)
%
% Usage :
% La = LinesToClusters2D(lines)
%
% input : lines     (n, 4)
% output: La        (n) cluster labels
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[~, ~, La] = LinesX2D(lines);
