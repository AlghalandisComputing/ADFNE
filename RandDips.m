function sam = RandDips(n, dip, k)
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

fix = dip-pi/4;
sam = [];
while length(sam)<n
    ags = fix+ScaleE(RandFisher(n, pi, k), 0, 2*pi, 0, pi/2);
    f = (ags>=0)&(ags<=pi/2);
    sam = [sam;ags(f)];
end
sam = sam(1:n);
