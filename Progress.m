function Progress(msg, i, n)
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

global t0 REPORT
if ~isempty(REPORT)
    if nargin==1;
        fprintf('%s%25s%s\n', REPORT, msg, '...');
        t0 = tic;
    else
        fprintf('%s%25s...%03d/%03d... {ET %s}\n', REPORT, msg, i, n, SecondsToClock(toc(t0)));
    end
end
