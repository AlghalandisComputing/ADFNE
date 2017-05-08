function ols = ClipLinesByPoly2D(lns, ply)
% ClipLinesByPoly2D
% {desc}
%
% Usage :
% ols = ClipLinesByPoly2D(lns, ply)
%
% input : lns       (n, 4)
%         ply       (m, 2)
% output: ols       (k, 4)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

fip = all(inpolygon(lns(:, [1, 3]), lns(:, [2, 4]), ply(:, 1), ply(:, 2)), 2);
xts = cell(0);
j = 0;
for i=1:size(lns, 1)
    px = lns(i, [1, 3]);
    py = lns(i, [2, 4]);
    [x, y] = polyxpoly(px, py, [ply(:, 1);ply(1, 1)], [ply(:, 2);ply(1, 2)], 'unique');
    xn = numel(x);
    if (xn==0) && fip(i)                                        %(1)fully inside
        j = j+1;
        xts{j} = [px', py'];
    else                                                        %intersection check
        if xn==1                                                %(2)one endpoint inside
            eip = inpolygon(px, py, ply(:, 1), ply(:, 2));
            j = j+1;
            xts{j} = [[px(eip), x]', [py(eip), y]'];
        elseif xn==2                                            %(3)two intersections
            pm = [0.5*(x(1)+x(2)), 0.5*(y(1)+y(2))];
            cip = inpolygon(pm(1), pm(2), ply(:, 1), ply(:, 2));
            if cip
                j = j+1;
                xts{j} = [x, y];
            else
                [~, w] = min(sum([px-x(1);py-y(1)].^2));
                j = j+1;
                xts{j} = [px(w), x(1);py(w), y(1)]';
                j = j+1;
                xts{j} = [px(3-w), x(2);py(3-w), y(2)]';
            end
        elseif xn>2                                             %(4)more intersections
            pts = [[x;px'], [y;py']];
            ots = SortPoints2D(pts);
            for k=1:size(ots, 1)-1
                p1 = ots(k, :);
                p2 = ots(k+1, :);
                pm = [0.5*(p1(1)+p2(1)), 0.5*(p1(2)+p2(2))];    %mid-point
                cip = inpolygon(pm(1), pm(2), ply(:, 1), ply(:, 2));
                if cip
                    j = j+1;
                    xts{j} = [p1;p2];
                end
            end
        end
    end
end
ols = cell2mat(cellfun(@(x)[x(1, :), x(2, :)], xts, 'UniformOutput', false)');
