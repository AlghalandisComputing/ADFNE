function Y = Scale(X, a, b)
% Scale
% scales (maps) X into range (a to b)
%
% Usage :
% Y = Scale(X, a, b)
%
% input : X         any array
%         a         minimum bound of the output
%         b         maxmium bound of the output
% output: Y         same as X but mapped
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; a = 0; b = 1; end
Y = double(X-min(X(:)))/double(range(X(:)))*(b-a)+a;
