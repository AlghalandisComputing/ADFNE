function Overlay2D(img, mask, color)
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

if nargin<3; color = [0, 0, 0]; end
[m, n] = size(img);
imagesc(img);
hold on
col = cat(3, zeros(m, n)+color(1), zeros(m, n)+color(2), zeros(m, n)+color(3));
h = imagesc(col);
set(h, 'AlphaData', mask);
