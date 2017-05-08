function ShowResults(data, dw)
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

if nargin<2; dw = [true, true]; end
[~, GCF, sx, sy, X, Y] = SplitMat(data{1});                     %data={Res, wt, rgn};
u = int32(numel(sx)/size(GCF, 1));
contourf(sx, sy, Scale(imresize(GCF, u)), 30, 'Color', 'none'); hold on
if dw(1); plot(X, Y, 'k-', 'LineWidth', 1); end                 %plot fnm
wt = data{2};
fill(wt(:, 1), wt(:, 2), 'w');                                  %clear outside
rgn = data{3};
DrawPoly2D(rgn, 'r-', 'LineWidth', 3);                          %plot region
axis image off
if dw(2); colorbar; end
