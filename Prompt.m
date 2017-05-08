function Prompt(msg, i, n)
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

if nargin<3; n = 1; end
if nargin<2; i = 1; end
if nargin<1; msg = '{}'; end
fprintf(1, '%s\n', repmat('=', 1, 80));
fprintf(1, '%s\n', repmat('-', 1, 80));
fprintf(1, '%s\t\t %03d-%03d %s\n', Time, i, n, msg);
fprintf(1, '%s\n', repmat('-', 1, 80));
fprintf(1, '%s\n', repmat('=', 1, 80));
