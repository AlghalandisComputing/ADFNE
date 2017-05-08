function [mins, maxs] = BBox3D(plys)
% BBox3D
% finds min and max of polygon in each axis X, Y and Z
%
% Usage :
% [mins, maxs] = BBox3D(plys)
%
% input : plys      cell
% output: mins      min values for X, Y and Z
%         maxs      max values for X, Y and Z
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

mins = min(cell2mat(cellfun(@min, plys, 'UniformOutput', false)));
maxs = max(cell2mat(cellfun(@max, plys, 'UniformOutput', false)));
