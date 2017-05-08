function ima = ImageToBW(img)
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

one = img(:, :, 1);
u = unique(one);
if length(u)==3
    one(one==u(end)) = 0;
    one(one==u(2)) = 1;
    ima = one;
else
    ima = ~im2bw(one);
end
