function imo = Overlay2DE(img, GCF)
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

ocf = Scale(Resize2D(GCF, size(img, 1), size(img, 2)));
imo = ocf.*~img;
