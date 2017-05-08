function ShowFNM(fnm, La)
% ShowFNM
% shows 2D or 3D fracture network
%
% Usage :
% ShowFNM(fnm, La)
%
% input : fnm       (n, 4) for 2D or cell for 3D
%         La        cluster labels
%
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<2; La = []; end
if iscell(fnm)
    cla
    DrawPolys3D(fnm, La);                   %3D fracture networks
else
    cla
    DrawLines2D(fnm, La);                   %2D fracture networks
end
