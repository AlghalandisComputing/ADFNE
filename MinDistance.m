function md = MinDistance(points)
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

n = size(points, 1);
md = 1e1000;
for i=1:n-1
    for j=i+1:n
        d = sum((points(i, :)-points(j, :)).^2);
        if d<md
            md = d;
        end
    end
end
