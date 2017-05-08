function DrawPolys3D(plys, La, rgba, axes)
% DrawPolys3D
% draws quickly 3D polygons
%
% Usage :
% DrawPolys3D(plys, La, rgba, axes)
%
% input : plys      cell
%         rgba      (r,g,b,a)
%         clus      La
%         axes      if true to draw set axes and adjust into 3D
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<4; axes = true; end
if nargin<3; rgba = [0.5, 0, 0.1, 0.5]; end
if nargin<2; La = []; end
hold on
cmap = colormap(jet);
for i=1:length(plys)
    ply = plys{i};
    if ~isempty(La) && La(i)<0                      %isolated fractures
        patch(ply(:, 1), ply(:, 2), ply(:, 3), [0.5, 0.5, 0.5], 'FaceAlpha', 0.5, ...
            'EdgeColor', 'none');
    else
        fvc = zeros(length(ply), 3);
        if isempty(La)                              %no cluster labels info provided
            fvc(1, :) = rgba(1:3);
        else
            fvc(1, :) = cmap(int32(double(La(i))/double(max(La))*64), :);
        end
        h = patch(ply(:, 1), ply(:, 2), ply(:, 3), 0, 'FaceAlpha', rgba(4));
        set(h, 'FaceVertexCData', fvc);
    end
end
if axes
    if length(plys)>1
        [mins, maxs] = BBox3D(plys);                %bounding box of polygons
        SetAxes3D(mins, maxs);
    end
end
