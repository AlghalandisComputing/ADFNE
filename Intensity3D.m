function [P10, P21] = Intensity3D(plys, N, h, dh)
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

if nargin<4; dh = 0; end
if nargin<3; h = 0.5; end
if nargin<2; N = [30, 30, 30]; end

%% P10: # (Length)
lines = LineSamples3D(N, h, dh);
[Ids, ~] = LinesXPolys3D(lines, plys);
n = length(plys);
m = size(lines, 1);
cnt = zeros(m, 1);
for i=1:n
    cnt = cnt+Ids{i};
end
lhs = Lengths3D(lines);
P10 = mean(cnt./lhs);

%% P21: L (Area)
smys = Stack(PolySamples3D(N, h, dh));
ars = polygonArea3d(smys);
[xts, ~] = PolysXPolys3DE(smys, plys);
n = length(xts);
tlh = zeros(n, 1);
for i=1:n
    lts = xts{i};
    for j=1:length(lts)
        pts = lts{j};
        tlh(i) = tlh(i)+TraceLength3D(pts);
    end
end
P21 = mean(tlh./ars);
