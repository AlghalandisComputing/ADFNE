function TestFNM3D(fnm)
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

[~, szs, ds, dds, ~] = PolyInfo3D(fnm);
subplot(221); DrawPolys3D(fnm, [], [1, 0, 1, 0.2], true);
subplot(222); HistoE5(szs, 15, '', 'Size', '', '', '', '%0.3f', 3);
subplot(223); RoseE5(ds, nan, 'Dip', '', false);
subplot(224); RoseE5(dds, nan, 'Dip Direction', '', false);
