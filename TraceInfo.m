function TraceInfo(lts)
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

m = length(lts);
for i=1:m
    trc = lts{i};
    n = length(trc);
    for j=1:n
        pts = trc{j};
        disp(pts);
        disp(repmat('%', 1, 70));
    end
end

