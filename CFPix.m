function cf = CFPix(img, w, weighted)
% CFPix
% Connectivity field in pixel format
%
% Usage :
% cf = CFPix(img, w, weighted)
%
% input : img       {}
%         w         {}
%         weighted  {}
% output: cf        CF
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[m, n] = size(img);
cf = zeros(0, 0);
I = 0;
for i=1:w:m                                                 %CF
    I = I+1;
    J = 0;
    for j=1:w:n
        ims = img;
        ims(i:i+w, j:j+w) = 1;                              %insert support
        imc = bwlabel(ims, 8);                              %label connected cells
        J = J+1;
        cf(I, J) = sum(imc(:)==imc(i+1, j+1));              %count connected cells >> CF
    end
end
if weighted; cf = cf/numel(cf); end
