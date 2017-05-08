function B = Resize2D(A, m, n)
% Resize2D
% resizes 2D matrix in shape (m, n)
%
% Usage :
% B = Resize2D(A, m, n)
%
% input : A         input 2d matrix
%         m,n       desired dimensions
% output: B         resized matrix (m, n)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[a, b] = size(A);
if nargin<2; m = 70; end
if nargin<3; n = m; end
zm = m/a;
zn = n/b;
B = A(floor((0:end*zm-1)/zm)+1, floor((0:end*zn-1)/zn)+1);
