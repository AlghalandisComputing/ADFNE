function varargout = SplitMat(X)
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

if iscell(X)
    for i=1:nargout
        varargout{i} = X{i};
    end
else
    for i=1:nargout
        varargout{i} = X(i, :);
    end
end
