function DrawTexts3D(pts, txts)
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

n = size(pts, 1);
for i=1:n
    x = pts(i, 1);
    y = pts(i, 2);
    z = pts(i, 3);
    text(x, y, z, txts{i}, 'FontSize', 15);
end
