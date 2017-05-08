function SavePolysToVTK3D(plys, colors, fname)
% SavePolysToVTK3D
% saves 3D polygons as standard VTK file (ASCII format)
%
% Usage :
% SavePolysToVTK3D(plys, colors, fname)
%
% input : plys      cell
%         colors    (x, 3[4]), with or without alpha values
%         fname     filename
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

nply = length(plys);
plyn = cellfun(@length, plys, 'UniformOutput', false);
npnt = sum(cell2mat(plyn));
fut = fopen(fname, 'w');
fprintf(fut, '# vtk DataFile Version 3.0\n');   %header...
fprintf(fut, 'Polygons by Younes Fadakar Alghalandis\n');
fprintf(fut, sprintf('ASCII\nDATASET POLYDATA\nPOINTS %d float\n', npnt));
for i=1:nply
    ply = plys{i};
    fprintf(fut, sprintf('%0.6f %0.6f %0.6f\n', ply'));
end
fprintf(fut, sprintf('POLYGONS %d %d\n', nply, npnt+nply));
k = 0;
for i=1:nply                                    %polygon data
    fprintf(fut, strcat(sprintf('%d ', plyn{i}, k:k+plyn{i}-1), '\n'));
    k = k+plyn{i};
end
fprintf(fut, sprintf('POINT_DATA %d\n', npnt));
fprintf(fut, 'COLOR_SCALARS lut 4\n');
if isempty(colors)
    colors = repmat([1, 0, 0.5, 1], nply, 1);
elseif size(colors, 2)==3                       %if no alpha provided,  set all to 1
    colors(:, 4) = 1;
end
for i=1:nply
    for j=1:plyn{i}
        fprintf(fut, strcat(sprintf('%0.3f ', colors(i, :)), '\n'));
    end
end
fclose(fut);
fprintf(1, 'Polygons were saved as file %s.\n', fname);     %report on screen
