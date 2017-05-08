function C = Clusters(S)
% Clusters
% clusters items based on common elements
%
% Usage :
% C = Clusters(S)
%
% input : S         cell
% output: C         cell
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if isempty(S); C = {}; return; end
while true
    m = length(S);
    united = zeros(m, 1);                                   %nothing is clustered yet
    C = cell(m, 1);
    u = 0;
    for i = 1:m-1
        if united(i); continue; end;
        p = S{i};
        for j = i+1:m
            q = S{j};
            com = intersect(p, q);                          %common elements
            if ~isempty(com)
                united(j) = 1;
                p = union(p, q);
                S{i} = p;
            end
        end
        u = u+1;
        C{u} = p;
    end
    if ~united(m)                                           %copy the last item if not united
        u = u+1;
        C{u} = S{m};
    end
    C = C(1:u);
    if any(united)
        S = C;
    else                                                    %all are united, i.e., clustered
        C = S;
        break
    end
end
