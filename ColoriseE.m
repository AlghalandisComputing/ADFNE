function colors = ColoriseE(x, cmap)
% ColoriseE
% {desc}
%
% Usage :
% colors = ColoriseE(x, cmap)
%
% input : x         {}
%         cmap      colormap
% output: colors    {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; cmap = colormap; end
xx = minmax(x(:)');
if (xx(2)-xx(1))<3*eps
    colors = zeros([size(x), 3]);
    return
end
y = int32(Scale(x, 1, 64));
colors = cmap(y, :);
colors = reshape(colors, [size(x), 3]);
