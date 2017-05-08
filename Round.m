function y = Round(x, dp)
% Round
% rounds x to an arbitrary (dp) decimal
%
% Usage :
% y = Round(x, dp)
%
% input : x         any
%         dp        decimal point, default=no decimal
% output: y         rounded output
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; dp = 1.0; end
y = round(x/dp)*dp;
