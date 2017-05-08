function recs = LinesToPolys3D(lines, Z, order)
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

if nargin<3; order = [1, 2, 3]; end
n = size(lines, 1);
lines = [lines(:, 1:2), Z, lines(:, 3:4), Z];
recs = cell(0);
for i=1:n
    rec = [lines(i, 1), lines(i, 2), lines(i, 3);...
               lines(i, 4), lines(i, 2), lines(i, 3);...
               lines(i, 4), lines(i, 5), lines(i, 3);...
               lines(i, 1), lines(i, 5), lines(i, 3)];
    rec = rec(:, order);
    recs{i} = rec;
end
recs = recs';
