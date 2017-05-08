function [msim, esim] = LineSimilarity2D(lns1, lns2)
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

m = size(lns1, 1);
n = size(lns2, 1);
cts1 = Centers2D(lns1);
cts2 = Centers2D(lns2);
dst = Scale(pdist2(cts1, cts2), 0, 1);
esim = zeros(m, 1);
for i=1:m
    u = lns1(i, 3:4)-lns1(i, 1:2);
    msim = 0;
    for j=1:n
        v = lns2(j, 3:4)-lns2(j, 1:2);
        csim = CosineSimilarity(u, v);
        jsim = csim*(1-dst(i, j));
        if jsim>msim; msim = jsim; end
    end
    esim(i) = msim;
end
msim = mean(esim);
