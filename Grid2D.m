function lns = Grid2D(X, Y1, Y2, cnt, ang, bx)
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

if nargin<6; bx = [0, 1, 0, 1]; end
if nargin<5; ang = 0; end
if nargin<4; cnt = [0.5, 0.5]; end
if nargin<1; X = linspace(0, 1, 7); end
n = numel(X);
if nargin<3; Y2 = ones(1, n); end
if nargin<2; Y1 = zeros(1, n); end
lns = vertcat(X, Y1, X, Y2)';
pts = vertcat(lns(:, 1:2), lns(:, 3:4));
if isempty(cnt)
    cnt = [mean(X), mean([Y1, Y2])];
end
if ang~=0
    ots = Rotate2D(pts, cnt, ang);
    lns = horzcat(ots(1:n, :), ots(n+1:end, :));
end
if ~isempty(bx)
    lns = ClipLines2DE(lns, bx);
end
