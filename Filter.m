function [le, eq, gr] = Filter(X, ref, tol)
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

if nargin<3; tol = 5*eps; end
eq = abs(X-ref) <= tol;
le = (X<ref) & (~eq);
gr = (X>ref) & (~eq);
