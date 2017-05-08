function lnss = PointsToLines3D(xts)
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

lnss = cell(0);
for i=1:length(xts)
    k = 0;
    lns = zeros(0, 6);
    for j=1:length(xts{i})
        pts = xts{i}{j};
        if numel(pts)~=6; continue; end
        k = k+1;
        lns(k, :) = [pts(1, :), pts(2, :)];
    end
    lnss{i} = lns;
end
