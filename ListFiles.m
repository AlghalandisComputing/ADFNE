function  files = ListFiles(folder)
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

info = dir(folder);
idx = [info.isdir];
files = {info(~idx).name}';
if ~isempty(files)
    files = cellfun(@(x)fullfile(folder, x), files, 'UniformOutput', false);
end
%subfolders
%sdir = {info(idx).name};
%sel = ~ismember(sdir, {'.', '..'});
%for did = find(sel)
%    nxt = fullfile(folder, sdir{did});
%    files = [files, ListFiles(nxt)];
%end
