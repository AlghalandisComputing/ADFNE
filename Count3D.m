function D = Count3D(pts, N, R)
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

if nargin<3; R = [0, 1, 0, 1, 0, 1]; end
if nargin<2; N = [10, 10, 10]; end
x1 = R(1); x2 = R(2);
y1 = R(3); y2 = R(4);
z1 = R(5); z2 = R(6);
gx = linspace(x1, x2, N(1)+1);
gy = linspace(y1, y2, N(2)+1);
gz = linspace(z1, z2, N(3)+1);
x = pts(:, 1);
y = pts(:, 2);
z = pts(:, 3);
D = zeros(N(1), N(2), N(3));
for i=1:N(1)                                        %X
    bx = (gx(i)<=x) & (x<gx(i+1));
    for j=1:N(2)                                    %Y
        by = (gy(j)<=y) & (y<gy(j+1));
        for k=1:N(3)                                %Z
            bz = (gz(k)<=z) & (z<gz(k+1));
            D(i, j, k) = sum((bx+by+bz)==3);
        end
    end
end
