function bbn = Backbone2D(lns, process, rgn, tol)
% Backbone2D
% returns backbone of 2D fracture network
%
% Usage :
% bbn = Backbone2D(lns, process, rgn, tol)
%
% input : lns       (n, 4)
%         process   if true to break lines into segments
%         rgn       region of study as polyline (k, 4)
%         tol       tolerance
% output: bbn       (m, 4)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; tol = 1e-9; end
if (nargin<3) || isempty(rgn)
    rgn = [0,0,1,0; 1,0,1,1; 1,1,0,1; 0,1,0,0];             %default: a unit square
end
if nargin<2; process = false; end
if process
    bbn = Stack(BreakLinesX2D([lns; rgn]));
else
    bbn = lns;
end
while true
    B = IsolatedLines2D(bbn, tol);
    if ~any(B); break; end                                  %break if no isolated line anymore
    bbn = bbn(~B, :);                                       %update backbone
end
