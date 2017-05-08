function sup = Sup3D(cnt, dim)
% Sup3D
% creates a 3D support (box)
%
% Usage:
% sup = Sup3D(cnt, dim)
%
% input : cnt       a point(3)
%         dim       [width, height, depth]
% output: sup       cell, six sides of a cube
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; dim = [1, 1, 1]; end
if nargin<1; cnt = [0.5, 0.5, 0.5]; end
sup = cell(6, 1);
sup{1} = [0, 0, 0; 0, 0, 1; 0, 1, 1; 0, 1, 0]; %left
sup{2} = [1, 0, 0; 1, 0, 1; 1, 1, 1; 1, 1, 0]; %right
sup{3} = [0, 0, 0; 1, 0, 0; 1, 1, 0; 0, 1, 0]; %bottom
sup{4} = [0, 0, 1; 1, 0, 1; 1, 1, 1; 0, 1, 1]; %top
sup{5} = [0, 0, 0; 0, 0, 1; 1, 0, 1; 1, 0, 0]; %front
sup{6} = [0, 1, 0; 0, 1, 1; 1, 1, 1; 1, 1, 0]; %back
d = cnt-[0.5*dim(1), 0.5*dim(2), 0.5*dim(3)];
for i=1:6
    sup{i}(:, 1) = sup{i}(:, 1)*dim(1)+d(1);
    sup{i}(:, 2) = sup{i}(:, 2)*dim(2)+d(2);
    sup{i}(:, 3) = sup{i}(:, 3)*dim(3)+d(3);
end
