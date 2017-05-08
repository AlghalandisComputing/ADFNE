function h = DrawSlices3D(data, a, axs)
% DrawSlices3D
% draws 3D slices of 3D volume data
%
% Usage :
% h = DrawSlices3D(data, a, axs)
%
% input : data      3D array
%         a         transparency
%         axs       if true to set and adjust axes into 3D
% output: h         handle to slice objects
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; axes = true; end
if nargin<2; a = 1; end
[m, n, o] = size(data);
[x, y, z] = meshgrid(0:m, 0:n, 0:o);
h = slice(x, y, z, Expand3D(data), m/2, n/2, o/2);
shading flat
if a~=1
    if a<0
        set(h, 'EdgeColor', 'none', 'FaceColor', 'interp');
        alpha(abs(a));
    else
        for i=1:length(h)
            set(h(i), 'alphadata', get(h(i), 'cdata'), 'facealpha', a);
        end
    end
end
if nargout==0; clear h; end
if axs; SetAxes3D([m, n, o]); end
