function PlotE(x, y, color, al, lw, ll)
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

if nargin<6; ls = '-'; end
if nargin<5; lw = 1; end
if nargin<4; al = 1; end
if nargin<3; color = 'k'; end
X = x(:)';
Y = y(:)';
xf = [X(1:end-1), fliplr(X)];
yf = [Y(1:end-1), fliplr(Y)];
patch(xf, yf, 'w', 'EdgeAlpha', al, 'FaceColor', 'none', 'LineStyle', ll, ...
    'LineWidth', lw, 'EdgeColor', color);
