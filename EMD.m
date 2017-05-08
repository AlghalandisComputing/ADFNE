function [V, x] = EMD(F, S1, S2, w1, w2)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : F: @GroundDistance
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.


if (nargin<5) || isempty(w2); w2 = ones(1, numel(S2)); end
if (nargin<4) || isempty(w1); w1 = ones(1, numel(S1)); end
gdm = GroundDistanceMatrix(F, S1, S2);
m = size(S1, 1);
n = size(S2, 1);
k = m*n;
a1 = zeros(m, k);
a2 = zeros(n, k);
for i=1:m
    for j=1:n
        k = j+(i-1)*n;
        a1(i, k) = 1;
        a2(j, k) = 1;
    end
end
A = [a1; a2];
W = [w1; w2];
P = ones(m+n, k);
Q = ones(m+n, 1)*min(sum(w1), sum(w2));
b = zeros(1, k);
[x, V] = linprog(gdm, A, W, P, Q, b);
V = V/sum(x);
