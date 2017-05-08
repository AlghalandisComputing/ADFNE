function [gdm] = GroundDistanceMatrix(F, S1, S2)
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

m = size(S1, 1);
n = size(S2, 1);
gdm = zeros(m, n);
for i=1:m
    for j=1:n
        gdm(i, j) = F(S1(i, :), S2(j, :));
    end
end
gdm = gdm';
gdm = gdm(:);
