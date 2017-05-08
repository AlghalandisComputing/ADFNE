function plys = GenPoly3DE5(n, attr)
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

if nargin<2;
    attr = {0.5, 0.01, 1};
elseif isnan(attr{1})
    attr{1} = 0.5*(attr{3}-attr{2});
end
if nargin<1; n = 1; end
R = RandExpBnd(n, attr{1}, attr{2}, attr{3});
plys = cell(0);
for i=1:n
    r = 0.5*R(i);
    plys{i} = [0, -r, -r; 0, r, -r; 0, r, r; 0, -r, r];
end
if n==1; plys = plys{1}; end
