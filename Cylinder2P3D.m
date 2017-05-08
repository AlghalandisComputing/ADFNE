function [X, Y, Z] = Cylinder2P3D(R, N, r1, r2)
% Cylinder2P3D
% {desc}
%
% Usage :
% [X, Y, Z] = Cylinder2P3D(R, N, r1, r2)
%
% input : R         {}
%         N         {}
%         r1        {}
%         r2        {}
% output: X,Y,Z     {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis (Original: Luigi Barone)
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

th = linspace(0, 2*pi, N);
m = length(R);                 
if m==1                      
    R = [R; R];              
    m = 2;                   
end
X = zeros(m, N);             
Y = zeros(m, N);
Z = zeros(m, N);
v = (r2-r1)/sqrt((r2-r1)*(r2-r1)');
R2 = [0, eps, 2*eps];
x2 = v-R2/(R2*v');   
x2 = x2/sqrt(x2*x2');
x3 = cross(v, x2);   
x3 = x3/sqrt(x3*x3');
r1x = r1(1);
r1y = r1(2);
r1z = r1(3);
r2x = r2(1);
r2y = r2(2);
r2z = r2(3);
vx = v(1);
vy = v(2);
vz = v(3);
x2x = x2(1);
x2y = x2(2);
x2z = x2(3);
x3x = x3(1);
x3y = x3(2);
x3z = x3(3);
tm = linspace(0, 1, m);
for j=1:m
  t = tm(j);
  X(j, :) = r1x+(r2x-r1x)*t+R(j)*cos(th)*x2x+R(j)*sin(th)*x3x; 
  Y(j, :) = r1y+(r2y-r1y)*t+R(j)*cos(th)*x2y+R(j)*sin(th)*x3y; 
  Z(j, :) = r1z+(r2z-r1z)*t+R(j)*cos(th)*x2z+R(j)*sin(th)*x3z;
end
%surf(X, Y, Z);

