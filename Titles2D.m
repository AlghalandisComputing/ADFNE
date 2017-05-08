function Titles2D(age, tl, xl, yl, ext, rgn, lw)
% Titles2D
% sets titles,  grid etc for current 2D axes
%
% Usage :
% Titles2D(age, tl, xl, yl, ext, rgn, lw)
%
% input : age       aspect, limits, grid switches
%         tl        title
%         xl        xlabel
%         yl        ylabel
%         ext       limits of axes
%         rgn       region of study
%         lw        {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<7; lw = 1.5; end
if (nargin<6) || isempty(rgn); rgn = [0, 1, 0, 1]; end
if (nargin<5) || isempty(ext); ext = [-0.03, 1.03, -0.03, 1.03]; end
if nargin<4; yl = 'Y'; end
if nargin<3; xl = 'X'; end
if nargin<2; tl = ''; end
if nargin<1; age = '=['; end
hold on
if lw>0; drawBox(rgn, 'k-', 'LineWidth', lw); end
if isempty(strfind(age, '-'))
    title(tl)
    xlabel(xl);
    ylabel(yl);
else
    axis off
end
box on
if strfind(age, '=')>0; axis image; end
if strfind(age, '+')>0; grid on; end
if strfind(age, '[')>0; axis(ext); end
hold off
