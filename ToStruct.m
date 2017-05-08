function S = ToStruct(data)
% ToStruct
% builds 'struct' data type from data
%
% Usage :
% S = ToStruct(data)
%
% input : data      any array
% output: S         struct
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

S = struct();
m = size(data, 1);
for i = 1:m
    S.(sprintf('S%d', i)) = data(i, :);
end
