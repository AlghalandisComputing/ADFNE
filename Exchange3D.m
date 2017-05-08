function [olys, w] = Exchange3D(plys, k)
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

olys = plys;
w = 0;
if k==0; return ;end
n = length(plys);
cts = Centroids3D(plys);
P = randperm(n);
IJ = [];
for i=1:n
    if ismember(i, IJ); continue; end
    bbx1 = Bbox(plys{P(i)});
    cnt1 = cts(P(i), :);
    for j=1:n
        if ismember(j, IJ)||(i==j); continue; end
        bbx2 = Bbox(plys{P(j)});
        cnt2 = cts(P(j), :);
        mov = cnt2-cnt1;
        chk2 = bbx2-[mov;mov];
        chk1 = bbx1+[mov;mov];
        out = any((chk2(:)<0)|(chk2(:)>1)|(chk1(:)<0)|(chk1(:)>1));
        if ~out
            olys{P(i)} = Translate3D(plys{P(i)}, mov);
            olys{P(j)} = Translate3D(plys{P(j)}, -mov);
            w = w+1;
            IJ = union(IJ, [i, j]);
            break
        end
    end
    if w>=k; break; end
end
