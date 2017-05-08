function [lines, olines] = GenFNM2D(n, theta, kappa, minl, maxl, rgn)
% GenFNM2D
% generates 2D fracture network
%
% Usage :
% [lines, olines] = GenFNM2D(n, theta, kappa, minl, maxl, rgn)
%
% input : n         number of fracture lines,  default=150
%         theta     main orientation,  default=0
%         kappa     Fisher dispersion factor,  default=0: omnidirectional
%         minl      minimum length of fracture lines,  default=0.05
%         maxl      maximum length of fracture lines,  default=1
%         rgn       region of study,  default=[0, 1, 0, 1] i.e.,  unit square
% output: lines     fracture lines after clipping by rgn
%         olines    original lines
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<6; rgn = [0, 1, 0, 1]; end
if nargin<5; maxl = 1; end
if nargin<4; minl = 0.05; end
if nargin<3; kappa = 0; end
if nargin<2; theta = 0; end
if nargin<1; n = 150; end
pts = rand(n, 2);                                       %locations~ U(0, 1)
ags = circ_vmrnd(theta, kappa, n);                      %oreint.~von-Mises(theta=0, kappa=0)
lhs = Scale(exprnd(1, n, 1), minl, maxl);               %lengths~ Exp(mu=1)
[dx, dy] = pol2cart(ags, 0.5*lhs);
olines = [pts(:, 1)-dx, pts(:, 2)-dy, pts(:, 1)+dx, pts(:, 2)+dy];     %original
lines = ClipLines2D(olines, rgn);                       %clipped by region of study
