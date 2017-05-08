function DrawPoints3D(pts, attr)
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

if nargin<2 || isempty(attr)
    attr = {'.', [0, 0, 0, 3], 'none'};
end
if isnumeric(attr{1})
    if attr{1}<0            %Sphere
        r = -attr{1};
        cl = attr{2}(1:3);
        al = attr{2}(4);
        [x, y, z] = sphere(12);
        c = ones(13, 13);
        hold on
        for i=1:size(pts, 1)
            h = surf(r*x+pts(i, 1), r*y+pts(i, 2), r*z+pts(i, 3), c);
            alpha(h, al);
            set(h, 'FaceColor', cl);
            set(h, 'EdgeColor', attr{3});
        end
    else
        if attr{1}==0       %Point
            C = [0, 0, 0];
        else
            C = rand(size(pts, 1), 1);
        end
        scatter3(pts(:, 1), pts(:, 2), pts(:, 3), attr{1}, C, 'filled');
    end
else
    plot3(pts(:, 1), pts(:, 2), pts(:, 3), attr{1}, 'Color', attr{2}(1:3), 'LineWidth', attr{2}(4));
end
