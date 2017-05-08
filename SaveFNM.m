function SaveFNM(fnm, fname)
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

fid = fopen(fname, 'w');
n = length(fnm);
fprintf(fid, '%d\n', n);
for i=1:n
    ply = fnm{i};
    m = size(ply, 1);
    fprintf(fid, '%d\n', m);
    for j=1:m
        fprintf(fid, '%g, %g, %g\n', ply(j, :));
    end
end
fclose(fid);
