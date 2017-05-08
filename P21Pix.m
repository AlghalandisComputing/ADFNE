function P21 = P21Pix(img, code, support)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : {}
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin<3; support = 0; end
if nargin<2; code = 1; end
[ny, nx] = size(img);
if (support>nx-2)||(support>ny-2); support = 0; end
if support>0
    sn = 1000;
    cx = floor(Scale(rand(sn, 1), 0, nx-support));
    cy = floor(Scale(rand(sn, 1), 0, ny-support));
    P21 = 0;
    for i = 1:sn
        ims = img(cy(i)+(1:support), cx(i)+(1:support));
        P21 = P21+P21Pix(ims, code, 0);
    end
    P21 = P21/sn;
else
    area = nx*ny;
    P21 = sum(img(:)==code)/area;
end
