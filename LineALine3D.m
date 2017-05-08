function theta = LineALine3D(lin1, lin2, err)
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

if nargin<3; err = 1e-9; end
p1 = lin1(1:3);
p2 = lin1(4:6);
p3 = lin2(1:3);
p4 = lin2(4:6);
if isCoplanar([p1;p2;p3;p4], err);
    v1 = p2-p1;
    v2 = p4-p3;
    theta = atan2(norm(cross(v1, v2)), dot(v1, v2));
else
    theta = NaN;
end
