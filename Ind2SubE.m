function sub = Ind2SubE(siz, ndx)
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

nout = numel(siz);
siz = double(siz);
sub = cell(0);
k = [1, cumprod(siz(1:end-1))];
for i=nout:-1:1, 
    vi = rem(ndx-1, k(i))+1;
    vj = (ndx-vi)/k(i)+1;
    sub{i} = double(vj);
    ndx = vi;
end
