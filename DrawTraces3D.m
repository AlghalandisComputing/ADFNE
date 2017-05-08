function DrawTraces3D(lts, colors)
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
        if isempty(pts)||(size(pts, 1)<2); continue; end
        plot3(pts(:, 1), pts(:, 2), pts(:, 3), '-', 'LineWidth', 2, 'Color', colors(i, :));
    end
end
