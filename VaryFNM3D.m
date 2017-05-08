function olys = VaryFNM3D(plys, s, p, a)
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

if nargin<4; a = 0; end                     %angle, direction
if nargin<3; p = 0; end                     %position, location
if nargin<2; s = 0; end                     %scale, size
olys = plys;
n = length(olys);
if s>0; olys = ScaleFNM3D(olys, Vary(ones(n, 1), s)); end
if p>0
    for i=1:n
        olys{i} = Translate3D(olys{i}, Vary(p*ones(1, 3))-p);
    end
end
if a>0
    [~, ~, ds, dds, ~] = PolyInfo3D(olys);
    ds = Vary(ds, a);
    dds = Vary(dds, a);
    for i=1:n
        olys{i} = PolyToDipDir3D(olys{i}, ds(i), dds(i));
    end
end
