function colors = Colorise(x, cmap)
% Colorise
% returns colors based on given data
%
% Usage :
% colors = Colorise(x, cmap)
%
% input : x         (n)
%         cmap      colormap
% output: colors    (64, 3)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; cmap = colormap(jet); end
y = int32(Scale(x, 1, 64));
colors = cmap(y, :);
