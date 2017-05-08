function SaveToFile3D(fname, x, index)
% SaveToFile3D
% saves 3D data into text file
%
% Usage :
% SaveToFile3D(fname, x)
%
% input : fname     filename
%         x         3D matrix
%         index     {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; index = false; end
if ~index
    dlmwrite(fname, x, 'delimiter', ', ')           %just data, no indices
else
    fut = fopen(fname, 'w');
    [m, n, o] = size(x);
    for i=1:m
        for j=1:n
            for k=1:o
                fprintf(fut, sprintf('%d,  %d,  %d,  %0.6f\n', i, j, k, x(i, j, k)));
            end
        end
    end
    fclose(fut);
end
