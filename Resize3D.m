function B = Resize3D(A, m, n, o)
% Resize3D
% resizes 3D matrix into shape (m, n, o)
%
% Usage :
% B = Resize3D(A, m, n, o)
%
% input : A         input 3d matrix
%         m,n,o     desired dimensions
% output: B         resized matrix (m, n, o)
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

[a, b, c] = size(A);
if nargin<2; m = 70; end
if nargin<3; n = m; end
if nargin<4; o = n; end
zm = m/a;
zn = n/b;
zo = o/c;
B = A(floor((0:end*zm-1)/zm)+1, floor((0:end*zn-1)/zn)+1, floor((0:end*zo-1)/zo)+1);
