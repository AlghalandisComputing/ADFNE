function L = TraceLength3D(pts)
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

if numel(pts)<=3
    L = 0;
else
    L = sqrt(sum((pts(2, :)-pts(1, :)).^2, 2));
end
