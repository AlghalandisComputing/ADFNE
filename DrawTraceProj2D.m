function DrawTraceProj2D(lts, cnt, colors)
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

hold on
for i=1:length(lts)
    trc = lts{i};
    for j=1:length(trc)
        pts = trc{j};
        n = size(pts, 1);
        if n>0
            lines = [repmat(cnt, n, 1), pts(:, 1:2)];
            ags = LineAngle2D(lines);
            [~, idx] = sort(ags);
            x = ags(idx);
            y = pts(idx, 3);
            dx = diff(x);
            idx = find(dx>3*mean(dx));              %determine if trace is segmented
            if ~isempty(idx)
                x = [x(1:idx);nan;x(idx+1:end)];
                y = [y(1:idx);nan;y(idx+1:end)];
            end
            plot(x, y, '-', 'LineWidth', 2, 'Color', colors(i, :));
        end
    end
end
