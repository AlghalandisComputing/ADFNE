function SetAxes3D(mins, maxs, vw, lt)
% SetAxes3D
% sets and adjust axes into 3D view
%
% Usage :
% SetAxes3D(mins, maxs)
%
% input : mins,maxs min and max values of X, Y and Z axes
%         vw        {}
%         lt        {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; lt = false; end
if nargin<3; vw = [-35, 20]; end
if nargin<2; maxs = [1, 1, 1]; end
if nargin<1; mins = [0, 0, 0]; end
hold on
plot3([mins(1), maxs(1)], [mins(2), mins(2)], [mins(3), mins(3)], '-', ...
    'LineWidth', 1.5, 'Color', [0.7, 0, 0]);
plot3([mins(1), mins(1)], [mins(2), maxs(2)], [mins(3), mins(3)], '-', ...
    'LineWidth', 1.5, 'Color', [0, 0.7, 0]);
plot3([mins(1), mins(1)], [mins(2), mins(2)], [mins(3), maxs(3)], '-', ...
    'LineWidth', 1.5, 'Color', [0, 0, 0.7]);
text(0.5*(mins(1)+maxs(1)), mins(2), mins(3), 'X', 'BackgroundColor', ...
    [0.7, 0, 0], 'Color', 'w')
text(mins(1), 0.5*(mins(2)+maxs(2)), mins(3), 'Y', 'BackgroundColor', ...
    [0, 0.7, 0], 'Color', 'w')
text(mins(1), mins(2), 0.5*(mins(3)+maxs(3)), 'Z', 'BackgroundColor', ...
    [0, 0, 0.7], 'Color', 'w')
%set(gca, 'CameraPosition', [-1*maxs(1), -2*maxs(2), 1.5*maxs(3)]);
%axis(reshape([mins;maxs], 1, []));
view(vw);
daspect([1, 1, 1]);
axis vis3d
camproj('perspective');
grid on
box on
plot3([mins(1), maxs(1)], [mins(2), mins(2)], [maxs(3), maxs(3)], '-', ...
    'LineWidth', 1, 'Color', [0, 0, 0]);
plot3([mins(1), mins(1)], [mins(2), maxs(2)], [maxs(3), maxs(3)], '-', ...
    'LineWidth', 1, 'Color', [0, 0, 0]);
if lt
    camlight right
    camlight left
end
axis tight
