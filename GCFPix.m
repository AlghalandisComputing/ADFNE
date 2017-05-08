function [GCF, imo, gn] = GCFPix(img, weighted, W)
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

if nargin<3
    [m, n] = size(img);
    W = 2.^(2:(floor(log2(min(m, n)))-1));
end
if nargin<2; weighted = false; end
t0 = Tic('GCF,  started...');
gn = length(W);
k = 0;
cnc = cell(0);
for w = W;                                          %varying supports
    cf = CFPix(img, w, false);
    k = k+1;
    if weighted
        cnc{k} = cf*numel(cf);                      %different from weighting in CF
    else
        cnc{k} = cf;
    end
    disp(num2str(w));
end
[m, n] = size(cnc{1});
m = ceil(m*1);
n = ceil(n*1);
GCF = cnc{1};
for i=2:length(W)
    GCF = GCF+Resize2D(cnc{i}, m, n);
end
imo = Overlay2DE(img, GCF);
Toc('GCF,  finished.', t0);
