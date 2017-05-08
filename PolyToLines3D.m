function lns = PolyToLines3D(ply, vec)
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

if nargin<2; vec = false; end
if vec
    lns = [ply, circshift(ply, -1)-ply];
else
    lns = [ply, circshift(ply, -1)];
end
