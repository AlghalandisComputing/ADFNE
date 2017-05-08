function [GCF, ids] = LoadGCF(files)
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

pth = [fileparts(files), '\'];
fils = dir(files);                                  %list all matched files
n = length(fils);
GCF = cell(n, 1);
for i=1:n
    GCF{i} = dlmread([pth, fils(i).name]);          %read data from files
end
fils = {fils.name};
ids = zeros(n, 1);
for i=1:n
    ids(i) = str2double(fils{i}(1:end-4));
end
