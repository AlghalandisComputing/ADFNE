function cells = Stereonet(dip, ddir, attr, den, skip)
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

if nargin<5; skip = false; end
if nargin<4; den = {9, 36, 1, {'k', 0.5, true, jet}}; end
if (nargin<3) || isempty(attr); attr = 'ro'; end
if ~skip
    gc = [0.8, 0.85, 0.9];
    hold on
    R = ScaleE(15:15:75, 0, 90, 0, 1);
    rectangle('Position', [-1, -1, 2, 2], 'Curvature', [1, 1], 'LineWidth', 1.5, ...
        'EdgeColor', [0, 0, 0], 'FaceColor', 'w');
    for r=R
        rectangle('Position', [-r, -r, 2*r, 2*r], 'Curvature', [1, 1], 'LineWidth', 1, ...
            'EdgeColor', gc);
    end
    th = linspace(0, 2*pi, 37);
    [x, y] = pol2cart(th(1:end-1), ones(1, 36));
    [x0, y0] = pol2cart(th(1:end-1), zeros(1, 36)+R(1));
    plot([x0;x], [y0;y], '-', 'Color', gc);
    plot([0, R(1);0, 0;0, -R(1);0, 0]', [0, 0;0, R(1);0, 0;0, -R(1)]', 'Color', gc);
    text(1.035, 0, '0', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    text(0, 1.04, '90', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    text(-1.04, 0, '180', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
        'Rotation', 90);
    text(0, -1.04, '270', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
    axis image off
    EAxes(-5);
end
hold on
dps = ScaleE(dip, 0, pi/2, 0, 1);
if ~isempty(den);
    [X, Y] = pol2cart(ddir, dps);
    R = Scale(linspace(0, Rad(90), den{1}+1), 0, 1);
    R = R(1:end-1);
    dr = R(2)-R(1);
    T = linspace(0, 2*pi, den{2}+1);
    T = T(1:end-1);
    tr = Rad(den{3});
    t = T(1):tr:T(2);
    if t(end)<T(2); t(end+1) = T(2); end
    k = numel(t);
    cells = cell(0);
    i = 0;
    for r1=R
        for t1=T
            [x, y] = pol2cart([t(end:-1:1)+t1, t+t1], [repmat(r1, 1, k), repmat(r1+dr, 1, k)]);
            d = sum(inpolygon(X, Y, x, y));
            if d>0;
                cnt = [mean(x), mean(y)];
                i = i+1;
                cells{i} = {[x;y]', cnt, d};
            end
        end
    end
    at = den{4};
    if ~isempty(at)
        n = length(cells);
        d = zeros(1, n);
        for i=1:n
            d(i) = cells{i}{3};
        end
        colors = Colorise(d, at{4});
        for i=1:n
            dat = cells{i};
            pts = dat{1};
            h = patch(pts(:, 1), pts(:, 2), 'none');
            h.EdgeColor = at{1};
            h.FaceColor = colors(i, :);
            h.FaceAlpha = at{2};
            if at{3}
                text(dat{2}(1), dat{2}(2), num2str(dat{3}), ...
                    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
            end
        end
    end
end
polar(ddir, dps, attr);
