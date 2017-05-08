function [X, Y, Z] = TrsToXYZnan3D(trs, pts)
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

n = size(trs, 1);
X = zeros(1, n*5);
Y = zeros(1, n*5);
Z = zeros(1, n*5);
for i=1:n
    tts = Closed(pts(trs(i, :), :));
    X(i*5-4:i*5) = [tts(:, 1)', nan];
    Y(i*5-4:i*5) = [tts(:, 2)', nan];
    Z(i*5-4:i*5) = [tts(:, 3)', nan];
end
