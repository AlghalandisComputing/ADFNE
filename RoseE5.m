function h = RoseE5(ags, nb, tl, color, q)
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

if nargin<5; q = false; end
if (nargin<4) || isempty(color); color = [0, 0.5, 0.5]; end
if (nargin<3) || isempty(tl); tl = 'Rose'; end
if (nargin<2) || isnan(nb); nb = 36; end
h = rose(ags, nb);
h.Color = color;
h.LineWidth = 1.5;
if q
    axs = axis;
    axis([0, axs(2), 0, axs(4)]);
    set(gca, 'YDir', 'reverse');
end
title(tl);
