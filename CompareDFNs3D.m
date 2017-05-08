function [c, h, i, b] = CompareDFNs3D(fnm1, fnm2)
% CompareDFNs3D
% {desc}
%
% Usage :
% [c, h, i, b] = CompareDFNs3D(fnm1, fnm2)
%
% input : fnm1      {}
%         fnm2      {}
% output: c,h,i,b   {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[cts1, szs1, ds1, dds1, ~] = PolyInfo3D(fnm1);
[cts2, szs2, ds2, dds2, ~] = PolyInfo3D(fnm2);

den1 = GDensity3D(cts1, 7, 9);
den2 = GDensity3D(cts2, 7, 9);

H1 = den1(:);
H2 = den2(:);
[c0, h0, i0, b0] = CompareHistogram(H1, H2);

H1 = hist(Scale(szs1), 15);
H2 = hist(Scale(szs2), 15);
[c1, h1, i1, b1] = CompareHistogram(H1, H2);

H1 = hist(Scale(ds1), 15);
H2 = hist(Scale(ds2), 15);
[c2, h2, i2, b2] = CompareHistogram(H1, H2);

H1 = Rosef(dds1, 12);
H2 = Rosef(dds2, 12);
[c3, h3, i3, b3] = CompareHistogram(H1, H2);

c = (c0+c1+c2+c3)/4;
h = (h0+h1+h2+h3)/4;
i = (i0+i1+i2+i3)/4;
b = (b0+b1+b2+b3)/4;
