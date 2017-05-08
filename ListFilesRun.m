function  ListFilesRun(folder, func)
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

global ii CC
info = dir(folder);
idx = [info.isdir];
files = {info(~idx).name}';
if ~isempty(files)
    files = cellfun(@(x)fullfile(folder, x), files, 'UniformOutput', false);
    ii = ii+1;
    CC{ii} = func(files);
end
%subfolders
sdir = {info(idx).name};
sel = ~ismember(sdir, {'.', '..'});
for did = find(sel)
    nxt = fullfile(folder, sdir{did});
    ListFilesRun(nxt, func);
end
