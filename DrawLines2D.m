function DrawLines2D(lines, La, rgb, age)
% DrawLines2D
% draws quickly 2D fracture lines
%
% Usage :
% DrawLines2D(lines, La, rgb, age)
%
% input : lines     (n, 4)
%         La        cluster labels
%         rgb       color,  default=[0, 0, 0]
%         age       axes, grid settings, check 'Titles2D'
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; age = '=['; end
if nargin<3; rgb = [0, 0, 0]; end
if nargin<2; La = []; end
if isempty(La) || all(La==0)
    [X, Y] = LinesToXYnan2D(lines);
    if all(rgb==0); rgb = [0, 0, 0]; end
    plot(X, Y, '-', 'Color', rgb)
else
    [X, Y] = LinesToXYnan2D(lines(La<0, :));                %isolated fractures
    plot(X, Y, '-', 'Color', [0.5, 0.5, 0.5])
    hold on
    for i=1:max(La)                                         %fracture clusters
        [X, Y] = LinesToXYnan2D(lines(La==i, :));
        plot(X, Y, '-', 'Color', rand(3, 1), 'LineWidth', 1.5);
    end
end
Titles2D(age)
