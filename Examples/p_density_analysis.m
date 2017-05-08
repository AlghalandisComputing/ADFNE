% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

% Example Applications of ADFNE:
% Density Analysis of 2D Fracture Networks

n = 200;                                                    %number of fractures
gn = 20;                                                    %block number
lines = GenFNM2D(n, 0, 0, 0.05, 0.5);                       %fracture network
[dn, x, y] = Density2D(lines, gn, gn);                      %true density
sdn = Smooth(dn, 1);                                        %smoothing
[X, Y] = LinesToXYnan2D(lines);                             %for performance
clf;                                                        %
subplot(121);                                               %
imagesc(x, y, dn);                                          %block map
set(gca, 'YDir', 'normal');                                 %match axes
hold on;                                                    %    
plot(X, Y, 'k-', 'LineWidth', 0.7);                         %overlay fracture network
Titles2D('-=[');                                            %
subplot(122);                                               %
contourf(0:1/(gn-1):1, linspace(0, 1, gn), sdn, 30);        %contouring
shading flat;                                               %
hold on;                                                    %
plot(X, Y, 'k-', 'LineWidth', 0.7);                         %
Titles2D('-=[');                                            %
FullScreen();                                               %fullscreen
SaveFig('density.png', '-r300');                            %save resulting graph
