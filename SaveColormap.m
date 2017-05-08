function SaveColormap(fname)
% SaveColormap
% saves current colormap as file
%
% Usage :
% SaveColormap(fname)
%
% input : fname     filename
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

cmap = get(gcf, 'Colormap');
save(fname, 'cmap');
