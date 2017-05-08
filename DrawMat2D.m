function h = DrawMat2D(A, xlm, ylm, typ)
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

if nargin<4; typ = 0; end
if typ==0
    [m, n] = size(A);
    if (nargin<3) || isempty(ylm); ylm = [0.5, m+0.5]; end
    if (nargin<2) || isempty(xlm); xlm = [0.5, n+0.5]; end
    B = zeros(m+1, n+1);
    B(1:m, 1:n) = A;
    h = pcolor(B);
    h.XData = Scale(h.XData, xlm(1), xlm(2));
    h.YData = Scale(h.YData, ylm(1), ylm(2));
    h.EdgeColor = 'none';
elseif typ==1
    h = imagesc(A);
    set(gca, 'YDir', 'normal');
else
    ccs = Scale(A, 1, 64, @int32);
    cmap = colormap;
    [m, n] = size(A);
    for i=1:m
        for j=1:n
            if isnan(A(i, j)); continue; end
            h = rectangle('Position', [j-0.5, i-0.5, 1, 1]);
            h.FaceColor = cmap(ccs(i, j), :);
            h.EdgeColor = 'none';
        end
    end
end
