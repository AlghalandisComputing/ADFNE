function s = Time(b)
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

if nargin<1; b = false; end
s = datestr(now, 'yyyy-mm-dd, HH-MM-SS-FFF');
if b; s = [s, '_', num2str(randi(1e8, 1))]; end
