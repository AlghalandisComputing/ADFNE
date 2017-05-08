function Processing(s, full)
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

if nargin<2; full = true; end
if nargin<1; s = 1; end
if full; FullScreen(); end
clf
text(0.39, 0.5, 'Processing...', 'FontSize', 30, 'FontName', 'Consolas');
text(0.39, 0.45, 'Launched by: Dr. Younes Fadakar Alghalandis', 'FontSize', 9, ...
    'FontName', 'Consolas');
text(0.39, 0.43, ['       Date: ', date], 'FontSize', 9, 'FontName', 'Consolas');
axis off
pause(s);
clf
