function [c, ags] = CHistoD(X, nb, attr, fc)
% CHistoD
% {desc}
%
% Usage :
% [c, ags] = CHistoD(X, nb, attr, fc)
%
% input : X         {}
%         nb        {}  
%         attr      {}
%         fc        {}
% output: c         {}
%         ags       {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; fc = [0.5, 0, 0.5]; end
if nargin<3 || isempty(attr); attr = {'r-', 2}; end
if nargin<2; nb = 12; end

Y = mod(X, 360);
ags = Range(0, 360, nb);
da = 0.5*(ags(2)-ags(1));
w = ((360-da)<=Y);
Y(w) = Y(w)-360;
c = zeros(1, nb);
for i=1:nb
    c(i) = sum(((ags(i)-da)<=Y) & (Y<(ags(i)+da)));
end
h = polar(Rad([ags, ags(1)]), [c, c(1)], attr{1});
set(h, 'LineWidth', attr{2});
x = get(h, 'XData');
y = get(h, 'YData');
patch(x, y, fc);
