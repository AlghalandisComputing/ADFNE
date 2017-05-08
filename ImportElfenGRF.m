function [x, y] = ImportElfenGRF(fname)
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

fid = fopen(fname);
if fid<=0
    x = nan;
    y = nan;
    return
end
data = textscan(fid, '%s', 'Delimiter', '\n');
fclose(fid);
data = data{:};
n = length(data);
for i=1:n
    if strcmp(data{i}, 'values {')
        break
    end
end
res = cell(0);
k = 0;
for j=i+1:n
    if strcmp(data{j}, '}')
        break
    else
        k = k+1;
        row = strsplit(data{j}, ' ');
        res{k} = [str2double(row{1}), str2double(row{2})];
    end
end
res = cell2mat(res');
x = res(:, 1);
y = res(:, 2);
