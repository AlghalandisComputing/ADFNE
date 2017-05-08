function N = ScaleM(M, a, b)
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

if nargin<3; a = 0; b = 1; end
N = zeros(size(M));
for i=1:size(M, 2)
    N(:, i) = Scale(M(:, i), a, b);
end
