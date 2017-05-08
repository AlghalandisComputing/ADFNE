function PlotCF2D(cf, x, y, lns, attr, varargin)
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

if nargin<5; attr = {0, '', 1.5, 'k'}; end
[ny, nx] = size(cf);
imagesc(x, y, cf, varargin{:});
set(gca, 'YDir', 'normal');
w = 0.5*(x(2)-x(1));
h = 0.5*(y(2)-y(1));
hold on
for j=1:nx
    for i=1:ny
        if attr{1}>0
            rectangle('Position', [x(j)-w, y(i)-h, 2*w, 2*h], 'LineWidth', attr{1});
        end
        if ~isempty(attr{2})
            text(x(j), y(i), num2str(cf(i, j)), 'HorizontalAlignment', 'Center', ...
                'VerticalAlignment', 'Middle', 'Color', attr{2});
        end
    end
end
if attr{3}>0
    [X, Y] = LinesToXYnan2D(lns);
    if isempty(attr{4})
        plot(X, Y);
    else
        plot(X, Y, '-', 'Color', attr{4}, 'LineWidth', attr{3});
    end
end
axis image
