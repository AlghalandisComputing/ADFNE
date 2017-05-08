function DrawPoly2D(ply, varargin)
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

oly = Closed(ply);
if ~isempty(varargin)
    plot(oly(:, 1), oly(:, 2), varargin{:})
else
    plot(oly(:, 1), oly(:, 2), 'r-', 'LineWidth', 1)
end
