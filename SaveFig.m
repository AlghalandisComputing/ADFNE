function SaveFig(fname, res)
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

if nargin<2; res = '-r300'; end
set(gcf, 'PaperPositionMode', 'auto');
if strcmpi(fname(end-2:end), 'PDF')
    set(gcf, 'PaperUnits', 'points');
    set(gcf, 'PaperSize', [1300, 850]);
    fmt = '-dpdf';
else
    fmt = '-dpng';
end
print(fname, res, fmt);
