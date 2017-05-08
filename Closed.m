function cly = Closed(ply)
% Closed
% closes an open polygon
%
% Usage :
% cly = Closed(ply)
%
% input : ply       (n, 2)
% output: cly       (n+1, 2)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

cly = [ply; ply(1, :)];
