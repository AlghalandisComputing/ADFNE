function xpt = LineXLine3D(lin1, lin2)
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

if false
    p1 = lin1(1:3);
    p2 = lin2(1:3);
    v1 = lin1(4:6)-p1;
    v2 = lin2(4:6)-p2;
    c = cross(v1, v2);
    a = cross(p2-p1, v2)/c;
    xpt = p1+a*v1;
else
    ply1 = [rand(1, 3);lin1(1:3);lin1(4:6)];
    ply2 = [rand(1, 3);lin2(1:3);lin2(4:6)];
    xpt = PolyXPoly3D(ply1, ply2);
    if size(xpt, 1)>1
        xpt = xpt(2, :);
    else                                        %no intersection
        xpt = [];
    end
end
