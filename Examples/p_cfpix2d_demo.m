% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

% Example Applications of ADFNE:
% Connectivity Field Image (CFi) for 2D Porous Model
clear all;
clc;
if 1
    %mdl = randi([0,1], 4, 4);                        %porous model
    %mdl = [1,0,1,0,1; 0,0,0,0,0; 0,0,0,0,0; 0,0,1,0,0; 1,0,0,0,1];
    %mdl = round(Scale(Smooth(mdl, 0.1), 0, 1));
    %mdl = CellAuto(71, 71);
    mdl = imread('cfi_in.png');
    cf = CFPix2D(mdl, 1, false, 4);                 %CFi
else
    load cfi_demo
end
clf;
subplot(121);
imagesc(mdl);
axis image off
subplot(122);
%sf = Smooth(Resize2D(cf, 90, 160), 1);
mx = 5;
imagesc(cf, [1, mx]);
%contour(sf, 50);
axis image off
colormap(jet)

%SaveFig([Time,'.png']);

