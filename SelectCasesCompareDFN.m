function CC = SelectCasesCompareDFN(files)
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

n = length(files);
lbls = cell(0);                                 %find labels
for i=1:n
    [~, name, ~] = fileparts(files{i});
    lbls{i} = name(strfind(name, '_r')+1:end);
end
lbls = unique(lbls);                            %list uniques
m = length(lbls);
S = struct();
for i=1:m
    S.(lbls{i}) = [];
end
for i=1:n
    [~, name, ~] = fileparts(files{i});
    p = strfind(name, '_r');
    lbl = name(p+1:end);
    S.(lbl) = [S.(lbl);[p, i]];                 %length and index
end
CC = cell(0);
for i=1:m
    g = S.(lbls{i});
    k = size(g, 1);
    [~, u] = min(g(:, 1));
    ref = files{g(u, 2)};                       %reference fnm
    fnm1 = TrendPlungeToPolys3D(ref);           %import data,  convert,  create polys
    [mns1, mxs1] = BBox3D(fnm1);
    C = cell(0);
    for j=1:k
        if j==u; continue; end
        cas = files{g(j, 2)};                   %case fnm for comparison
        fprintf('%s[%03d-%03d:%03d-%03d]\n%s\nvs\n%s\n\n', ...
            repmat('-', 1, 10), i, m, j, k, ref, cas);
        fnm2 = TrendPlungeToPolys3D(cas);
        [mns2, mxs2] = BBox3D(fnm2);
        mns = min(mns1, mns2);
        mxs = max(mxs1, mxs2);
        R = Flat([mns;mxs])';
        C{j} = {cas, CompareDFNs3DE(fnm1, fnm2, true, R)};      %compare
    end
    CC{i} = {lbls{i}, C};                       %labels,  similarities
    fprintf('!%s group comparison completed.\n', lbls{i});
end
pth = fileparts(files{1});
CC = {pth, CC};
fprintf('%s\n', repmat('#', 1, 30));
