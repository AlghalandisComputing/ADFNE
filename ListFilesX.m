function  files = ListFilesX(folder, ext)
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

if nargin<2; ext = '*'; end
info = dir([folder,  '\*.',  ext]);
idx = [info.isdir];
files = {info(~idx).name}';
if ~isempty(files)
    files = cellfun(@(x)fullfile(folder, x), files, 'UniformOutput', false);
end
