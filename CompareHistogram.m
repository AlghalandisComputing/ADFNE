function [cor, chi, int, bha] = CompareHistogram(H1, H2, scaled)
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

if nargin<3; scaled = false; end
if scaled
    H1 = Scale(H1);
    H2 = Scale(H2);
end
n = length(H1);
u = mean(H1);
v = mean(H2);
cor = sum((H1-u).*(H2-v))/sqrt(sum((H1-u).^2)*sum((H2-v).^2));
chi = sum(((H1-H2).^2)./(H1+eps));
int = sum(min(H1, H2));
bha = sqrt(1-(sum(sqrt(H1.*H2))/sqrt(u*v*n*n)));
