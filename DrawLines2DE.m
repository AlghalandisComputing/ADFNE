function DrawLines2DE(lnss, cfgs, age)
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

if nargin<3; age = '=['; end
n = length(lnss);
if (nargin<2) || isempty(cfgs); cfgs = repmat({[0, 0, 0], 1}, n, 1); end
if n>1; hold on; end
for i=1:n
    lns = lnss{i};
    [X, Y] = LinesToXYnan2D(lns);
    plot(X, Y, '-', 'Color', cfgs{i}{1}, 'LineWidth', cfgs{i}{2});
end
Titles2D(age);
