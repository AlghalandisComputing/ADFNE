function DrawCircle2D(X, Y, R, ec, fc)
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

if nargin<5; fc = 'none'; end
if nargin<4; ec = 'k'; end
if numel(R)==1
    D = zeros(size(X))+R*2;
else
    D = R*2;
end
for i=1:length(X)
    rectangle('Position', [X(i)-0.5*D(i), Y(i)-0.5*D(i), D(i), D(i)], 'Curvature', [1, 1], ...
        'FaceColor', fc, 'EdgeColor', ec);
end
