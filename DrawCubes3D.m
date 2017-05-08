function DrawCubes3D(D, whd, cmap)
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

if nargin<3; cmap = colormap; end
if (nargin<2)||isempty(whd); whd = [1, 1, 1]; end
w = 0.5*whd(1);
h = 0.5*whd(2);
d = 0.5*whd(3);
C = ColoriseE(D, cmap);
[I, J, K] = size(D);
for i=1:I
    for j=1:J
        for k=1:K
            DrawCube3D([i-w, j-h, k-d], whd, C(i, j, k, :))
        end
    end
end
