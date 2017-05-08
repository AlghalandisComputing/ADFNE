function bxp = BoxPlotE(X, dim, cnov, cbox)
% BoxPlotE
% {}
%
% Usage :
% bxp = BoxPlotE(X, dim, cnov, cbox)
%
% input : X         {}
%         dim       {}
%         cnov      {}
%         cbox      {}
% output: bxp       {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; cbox = [0, 0.5, 1, 0.2]; end
if nargin<3; cnov = [1, 0, 0.5, 0.2]; end
if nargin<2; dim = 1; end
UBV = quantile(X, 0.75, dim);                               %upper box value
LBV = quantile(X, 0.25, dim);                               %lower box value
H = UBV-LBV;                                                %height of box
med = quantile(X, 0.5, dim);                                %median value
ubv = UBV+1.5*H;
lbv = LBV-1.5*H;
n = size(X, 3-dim);
UWV = zeros(1, n);
LWV = zeros(1, n);
for i=1:n
    x = X(:, i);
    UWV(i) = max(x(x < ubv(i)));                            %upper whiskler value
    LWV(i) = min(x(x > lbv(i)));                            %lower whiskler value
end
bxp = [LBV-3*H; LBV-1.5*H; LWV; LBV; med; UBV; UWV; UBV+1.5*H; UBV+3*H];
if ~isempty(cnov)
    hold on;
    %plot(bxp');
    n = size(X, 2);
    x = [linspace(1, n, n), linspace(n, 1, n)];
    y = [bxp(3, :), bxp(7, end:-1:1)];
    h = fill(x, y, cnov(1:3));
    h.FaceAlpha = cnov(4);
    h.EdgeColor = cnov(1:3);
    y = [bxp(4, :), bxp(6, end:-1:1)];
    h = fill(x, y, cbox(1:3));
    h.FaceAlpha = cbox(4);
    h.EdgeColor = cbox(1:3);
end
%UEV = X > UBV+3*H;                      %upper extreme values
%LEV = X < LBV-3*H;                      %lower extreme values
%UOV = (X > UBV+1.5*H) & (X < UBV+3*H);  %upper outlier values
%LOV = (X < LBV-1.5*H) & (X > LBV-3*H);  %lower outlier values
%NOV = ~(UEV | LEV | UOV | LOV);         %non-outlier values
