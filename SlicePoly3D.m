function [cnt, pnt] = SlicePoly3D(ply, r)
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

lns = PolyToLines3D(ply, true);
u = size(ply, 1);
idx = 1:u;
PQ = [idx', circshift(idx', -1)];
pnt = [];
for w=idx
    for k=1:30
        cnt = ply(PQ(w, 1), :)+rand*(ply(PQ(w, 2), :)-ply(PQ(w, 1), :));
        gc = cell(0);
        j = 0;
        for i=setdiff(idx, w)
            xp = intersectLineSphere(lns(i, :), [cnt, r]);
            if isnan(xp(1)); continue; end
            j = j+1;
            gc{j} = xp;
        end
        gc = Stack(gc);
        xc = cell(0);
        j = 0;
        for i=1:size(gc, 1)
            b = isPointInPolygon(gc(i, :), ply);
            if ~b; continue; end
            j = j+1;
            xc{j} = gc(i, :);
        end
        if ~isempty(xc)
            pnt = xc{1};
            break
        end
    end
    if ~isempty(pnt); break; end
end
