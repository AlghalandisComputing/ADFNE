function data = ImportElfenEXP(fname, from, to)
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

if nargin<3; to = inf; end
if nargin<2; from = 4; end
fid = fopen(fname, 'r');
vars = textscan(fid, '%s', 1, 'Delimiter', '\n', 'MultipleDelimsAsOne', true, ...
    'HeaderLines', from-2, 'ReturnOnError', false);
vars = strsplit(strrep(vars{1}{:}, '"', ''), ' ');
fmt = [repmat('%f', 1, length(vars)), '%[^\n\r]'];
data = textscan(fid, fmt, to-from+1, 'Delimiter', ' ', 'MultipleDelimsAsOne', true, ...
    'HeaderLines', from-1, 'ReturnOnError', false);
fclose(fid);
data = table(data{1:end-1}, 'VariableNames', vars);
