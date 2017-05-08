function nGCF = NormaliseGCF(GCF, nd)
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

if nargin<2; nd = 14; end
[m, n] = size(GCF{1});
sf = (m*n)^2*nd;
nGCF = cell(0);
for i=1:length(GCF)
    nGCF{i} = GCF{i}/sf;
end
