function Ra = Relabel(La)
% Relabel
% relabel cluster labels according to their number of elements
%
% Usage :
% Ra = Relabel(La)
%
% input : La        labels
% output: Ra        relabeled output
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

k = max(La);                                %highest label
frq = zeros(k, 1, 'int32');
for i=1:k                                   %frequency of each label
    frq(i) = sum(La==i);
end
[~, idx] = sort(frq);                       %sort based on their frequencies
Ra = La;
for i=1:k
    Ra(La==idx(i)) = i;                     %apply relabing
end
