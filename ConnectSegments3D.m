function [lts, wts, otl, lns] = ConnectSegments3D(xts, ids)
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

Progress('ConnectSegments3D');
n = length(ids);
wts = cell(0);
u = 0;
for i=1:n
    idx = ids{i};
    if isempty(idx); continue; end
    k = find(diff(idx)>1);
    if isempty(k)
        tts = {unique(Trunc(Stack(xts{i}(1:end)), 9), 'rows', 'stable')};
    else
        w = numel(k);
        k = unique([0, k', length(idx)]);
        tts = cell(0);
        v = 0;
        for j=1:w+1
            v = v+1;
            tt = Trunc(Stack(xts{i}(k(j)+1:k(j+1))), 9);
            tts{v} = unique(tt, 'rows', 'stable');
        end
    end
    if tts{1}(1, :)==tts{end}(end, :)
        tts{1} = unique([tts{end};tts{1}], 'rows', 'stable');
        tts = tts(1:end-1);
    end
    %closed = all((tts{}(1, :)==tts{}(end, :)));       %if closed curve
    %        if closed
    %            lts{i} = [tts;tts(1, :)];
    %        else
    %
    u = u+1;
    wts{u} = tts;
end
lts = cell(0);
j = 0;
for i=1:u
    trc = Stack(wts{i});
    if size(trc, 1)<3; continue; end
    d13 = sum((trc(1, :)-trc(3, :)).^2);
    d23 = sum((trc(2, :)-trc(3, :)).^2);
    if d13<d23
        t = trc(1, :);
        trc(1, :) = trc(2, :);
        trc(2, :) = t;
    end
    j = j+1;
    lts{j} = trc;
end
wts = wts';
lts = lts';
otl = ReorderPolys3D(lts);
lns = zeros(u, 6);
for i=1:j
    lns(i, :) = [otl{i}(1, :), otl{i}(end, :)];
end
Progress('ConnectSegments3D', 1, 1);
