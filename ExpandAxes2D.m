function ExpandAxes2D(rate)
% ExpandAxes2D
% expands current axes by rate (+:relative, -:absolute)
%
% Usage:
% ExpandAxes2D(rate)
%
% input : rate      to expand axes symmetrically
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

a = axis;
if rate>0                           %relative expansion
    fx = a(2)-a(1);
    fy = a(4)-a(3);
else                                %absolute expansion
    fx = -1;
    fy = -1;
end
axis([a(1)-rate*fx, a(2)+rate*fx, a(3)-rate*fy, a(4)+rate*fy]);
