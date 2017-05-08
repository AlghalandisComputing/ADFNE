function olys = RotatePolyNormal3D(plys, theta, cnt)
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

if iscell(plys)
    olys = plys;
    nls = PolyNormalLines3D(plys);
    for i=1:length(plys)
        lne = [nls(i, 1:3), nls(i, 4:6)-nls(i, 1:3)];
        T = createRotation3dLineAngle(lne, theta);
        olys{i} = transformPoint3d(plys{i}, T);
    end
else
    %nls = PolyNormalLines3D({plys});
    nls = PolyNormals3D({plys});
    lne = [cnt, nls];
    %lne = [nls(1:3), nls(4:6)-nls(1:3)];
    T = createRotation3dLineAngle(lne, theta);
    olys = transformPoint3d(plys, T);
end
