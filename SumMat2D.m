function S = SumMat2D(args)
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

args = args';
mn = cell2mat(cellfun(@size, args, 'UniformOutput', false));
sz = [max(mn(:, 1)), max(mn(:, 1))];
C = cellfun(@(x)imresize(x, sz, 'nearest'), args, 'UniformOutput', false);
S = zeros(size(C{1}));
for i=1:length(args)
    S = S+C{i};
end

