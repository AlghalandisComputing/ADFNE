function cm = ConnectivityMatrix(ids, n, ful, mat, fnm)
% ConnectivityMatrix
% computes connectivity matrix of fracture network
%
% Usage :
% cm = ConnectivityMatrix(ids, n, full, mat, fnm)
%
% input : ids       intersection indices
%         n         number of fractures
%         ful       if true returns full matrix
%         mat       if false sparse form of results
%         fnm       fracture network
% output: cm        (n, n)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if nargin==5                                        %to find indices if not provided
    if iscell(fnm)
        [~, ids, ~] = PolysX3D(fnm);                %3D fracture network
    else
        [~, ids, ~] = LinesX2D(fnm);                %2D fracture network
    end
    n = size(fnm, 1);
end
if nargin<4; mat = true; end
if nargin<3; ful = false; end
cm = zeros(n, n);
for i=1:size(ids, 1)
    if iscell(ids)
        I = ids{i}(1);
        J = ids{i}(2);
    else
        I = ids(i, 1);
        J = ids(i, 2);
    end
    cm(I, J) = 1;
    if ful; cm(J, I) = 1; end
end
if ~mat; cm = sparse(cm); end
