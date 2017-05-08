function La = Labels(C, n)
% Labels
% extracts labels from clusters
%
% Usage :
% La = Labels(C, n)
%
% input : C         cell of Clusters
%         n         number of fractures
% output: La        labels for all fractures
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

La = zeros(n, 1);
for i = 1:length(C)
    La(C{i}) = i;
end
f = (La==0);                        %isolated fractures
La(f) = -(1:sum(f));                %relabeling
