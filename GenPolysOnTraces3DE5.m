function plys = GenPolysOnTraces3DE5(lns, otl, attr)
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

if nargin<3; attr = {0.5, 0.01, 1}; end
Progress('GenPolysOnTraces3D');
lths = Lengths3D(lns);
n = length(otl);
plys = cell(0);
for i=1:n
    trc = otl{i};                                           %trace
    [cts, ~, dip, ddir, ~] = PolyInfo3D({trc});             %its info
    pnt = [];
    while isempty(pnt)
        wly = Translate3D(PolyToDipDir3D(GenPoly3DE5(1, attr), dip, ddir), cts);
        [cnt, pnt] = SlicePoly3D(wly, lths(i));
    end
    d = lns(i, 1:3)-cnt;
    wly = Translate3D(wly, d);
    ct = lns(i, 1:3);
    theta = -LineALine3D(lns(i, :), [cnt+d, pnt+d]);        %check, some are not correct!
    wly = RotatePolyNormal3D(wly, theta, ct);
    plys{i} = wly;
    Progress('GenPolysOnTraces3D', i, n);
end
plys = plys';
