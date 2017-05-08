function [c, h, i, b] = CompareDFNs3DE(fnm1, fnm2, scaled, R)
% CompareDFNs3DE
% {desc}
%
% Usage :
% [c, h, i, b] = CompareDFNs3DE(fnm1, fnm2, scaled, R)
%
% input : fnm1      {}
%         fnm2      {}  
%         scaled    {}
%         R         {}
% output: c,h,i,b   {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; R = [0, 1, 0, 1, 0, 1]; end
if nargin<3; scaled = false; end
[cts1, szs1, ds1, dds1, ~] = PolyInfo3D(fnm1);
[cts2, szs2, ds2, dds2, ~] = PolyInfo3D(fnm2);

f11 = Filter(ds1, pi/4, 1e-9);
f12 = Filter(dds1, pi, 1e-9);
den11 = GDensity3D(cts1(f11, :), 7, 9, R);
den12 = GDensity3D(cts1(f12, :), 7, 9, R);

f21 = Filter(ds2, pi/4, 1e-9);
f22 = Filter(dds2, pi, 1e-9);
den21 = GDensity3D(cts2(f21, :), 7, 9, R);
den22 = GDensity3D(cts2(f22, :), 7, 9, R);

[c0, h0, i0, b0] = CompareHistogram(den11(:), den21(:), scaled);
[c1, h1, i1, b1] = CompareHistogram(den12(:), den22(:), scaled);

H1 = hist(szs1, 15);
H2 = hist(szs2, 15);
[c2, h2, i2, b2] = CompareHistogram(H1, H2, scaled);

m1 = mean(szs1);
m2 = mean(szs2);
mm = 0.5*(m1+m2);
c3 = 1-abs(m1-mm)/mm;

c = (c0+c1+c2+c3)/4;
h = (h0+h1+h2)/3;
i = (i0+i1+i2)/3;
b = (b0+b1+b2)/3;
