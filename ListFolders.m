function  folders = ListFolders(pth)
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

info = dir(pth);
idx = [info.isdir];
sdir = {info(idx).name};
sel = ~ismember(sdir,  {'.', '..'});
folders = fullfile(pth, sdir(sel)');
for i=1:length(folders)
    folders = [folders; ListFolders(folders{i})];
end
