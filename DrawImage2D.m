function DrawImage2D(img, attr)
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

if nargin<2; attr = {111, [], [], '-='}; end
if ~isempty(attr{1}); subplot(attr{1}); end
if ~isempty(attr{2})
    imagesc(attr{2}, attr{3}, img);
else
    imagesc(img);
end
set(gca, 'YDir', 'normal');
if ~isempty(attr{4}); Titles2D(attr{4}); end
