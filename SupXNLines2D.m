function xN = SupXNLines2D(sup, lines)
% SupXNLines2D
% finds number of intersected 2D fractures by a 2D support
%
% Usage :
% xN = SupXNLines2D(sup, lines)
%
% input : sup       (4), e.g., [0, 1, 0, 1]
%         lines     (n, 4)
% output: xN        number of intersected lines
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

xN = sum(sum(ClipLines2D(lines, sup), 2)>0);            %utilises clipping concept
