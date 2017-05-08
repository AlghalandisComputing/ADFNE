function F = RandFisher(n, m, k)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : n         number,
%         m         mean angle
%         k         dispersion factor
% output: F         [-pi<F<pi]>> 0..2*pi
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; k = 0; end
if nargin<2; m = 0; end
if nargin<1; n = 1; end
F = circ_vmrnd(m, k, n);
f = (F<0);
F(f) = F(f)+2*pi;
