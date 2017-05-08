function EAxes(p)
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

if nargin<1; p = 5; end
if p<0;
    p = -p;
else
    axis tight
end
wh = axis;
w = wh(2)-wh(1);
h = wh(4)-wh(3);
p = p*0.01;
axis([wh(1)-p*w, wh(2)+p*w, wh(3)-p*h, wh(4)+p*h]);
