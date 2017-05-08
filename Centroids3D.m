function cts = Centroids3D(plys)
% Centroids3D
% {desc}
%
% Usage :
% cts = Centroids3D(plys)
%
% input : plys      (n, m, 3)
% output: cts       (n, 3)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

n = length(plys);
cts = zeros(n, 3);
for i=1:n
    cts(i, :) = mean(plys{i}, 1);
end
