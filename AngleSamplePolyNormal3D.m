function ags = AngleSamplePolyNormal3D(plys, lne)
% AngleSamplePolyNormal3D
% {...}
%
% Usage :
% ags = AngleSamplePolyNormal3D(plys, lne)
%
% input : plys      cell(n)
%         lne       (6)
% output: ags       alpha if line is sampling line
%                   beta if line is sampling plane normal
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

p1 = lne(4:6)-lne(1:3);
n = length(plys);
ags = zeros(n, 1);
for i=1:n
    pln = createPlane(plys{i});
    nrm = planeNormal(pln);
    ags(i) = anglePoints3d(p1, [0,0,0], nrm);
end
