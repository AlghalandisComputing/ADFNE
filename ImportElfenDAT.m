function [pts, lbs] = ImportElfenDAT(fname)
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

fid = fopen(fname, 'r');
tline = fgets(fid);
from = 1; to = 1;
i = 1;
seek = true;
while ischar(tline)
    if seek && ~isempty(strfind(tline, 'Points {'))
        from = i;
        seek = false;
    end
    if strfind(tline, 'Point_output_labels {'); to = i; break; end
    i = i+1;
    tline = fgets(fid);
end
fseek(fid, 0, -1);
pts = cell2mat(textscan(fid, '%f%f', to-2-from, 'Delimiter', ' ', ...
    'MultipleDelimsAsOne', true, 'HeaderLines', from, 'ReturnOnError', false));
fseek(fid, 0, -1);
lbs = textscan(fid, '%s', to-2-from, 'Delimiter', '"', ...
    'MultipleDelimsAsOne', true, 'HeaderLines', to, 'ReturnOnError', false);
fclose(fid);
lbs = lbs{:};
