function cls = ClipLines2D(lns, box)
% ClipLines2DE
% returns clipped 2D fracture lines by a given rectangle (box)
%
% Usage :
% cls = ClipLines2D(lns, box)
%
% input : lns       (n, 4)
%         box       (4), default=[0, 1, 0, 1]
% output: cls       (n, 4)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; box = [0, 1, 0, 1]; end
cls = cell(0);
for i=1:size(lns, 1)
    cls{i} = clipEdge(lns(i, :), box);
end
cls = cell2mat(cls');
