function [Xn, Yn, nn, Xp, Yp, np] = TrendUD(Y)
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

[m, n] = size(Y);
Xn = zeros(0);
Yn = zeros(0);
Xp = zeros(0);
Yp = zeros(0);
nn = zeros(1, n-1);
np = zeros(1, n-1);
for i=1:m
    for j=1:n-1
        if Y(i, j+1)-Y(i, j)<=0
            Xn = [Xn, j:j+1, NaN];
            Yn = [Yn, Y(i, j:j+1), NaN];
            nn(j) = nn(j)+1;
        else
            Xp = [Xp, j:j+1, NaN];
            Yp = [Yp, Y(i, j:j+1), NaN];
            np(j) = np(j)+1;
        end
    end
end
