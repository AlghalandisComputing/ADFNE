function Report(X)
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

Y = X(:);
fprintf('min : %g\nQ25 : %g\nmean: %g\nQ75 : %g\nmax : %g\nstd : %g\n\n', ...
    min(Y), quantile(Y, 0.25), mean(Y), quantile(Y, 0.75), max(Y), std(double(Y)));
