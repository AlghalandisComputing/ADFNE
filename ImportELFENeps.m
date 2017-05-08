function [time, data] = ImportELFENeps(filename, st, en)
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

delimiter = ' ';
if nargin <= 2
    st = 4;
    en = inf;
end
fmt = '%f%f%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';
fid = fopen(filename, 'r');
da = textscan(fid, fmt, en(1)-st(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', ...
              true, 'HeaderLines', st(1)-1, 'ReturnOnError', false);
for k=2:length(st)
    frewind(fid);
    db = textscan(fid, fmt, en(k)-st(k)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', ...
                  true, 'HeaderLines', st(k)-1, 'ReturnOnError', false);
    for col=1:length(da)
        da{col} = [da{col}; db{col}];
    end
end
fclose(fid);
data = [da{1:end-1}];
time = data(:, 1);
data = data(:, 2);
