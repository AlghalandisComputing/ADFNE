function out = Cext(file, ext)
% Cext
% replace the extention of a file with ext
%
% Usage :
% out = Cext(file, ext)
%
% input : file      filename(with ext)
%         ext       desired extension
% output: out       output name
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

out = [file(1:end-3), ext];
