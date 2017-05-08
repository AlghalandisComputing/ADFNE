function LoadColormap(fname)
% LoadColormap
% updates current colormap from file
%
% Usage :
% LoadColormap(fname)
%
% input : fname     filename
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

load(fname, 'cmap');
set(gcf, 'Colormap', cmap);
