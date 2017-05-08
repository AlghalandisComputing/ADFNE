function pts = OnSphere3D(cnt, rho, typ, N)
% {name}
% {desc}
%
% Usage :
% {form}
%
% input : {}
%         theta     azimuthal coordinate [0, 2pi]=longitude, 
%         phi       polar coordinate [0, pi]=colatitude
%         rho       radius
% output: {}
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

switch typ
    case 'regular'
        nt = N(1);
        np = N(2);
        pts = zeros(nt*np, 3);
        k = 1;
        el = linspace(-pi/2, pi/2, np);
        for az = linspace(0, 2*pi, nt);
            [x, y, z] = sph2cart(az, el, rho);
            pts(k:k+np-1, :) = [x+cnt(1);y+cnt(2);z+cnt(3)]';
            k = k+np;
        end
    case 'random'
        n = N;
        z = rho*(2*rand(n, 1)-1);
        t = 2*pi*rand(n, 1);
        x = sqrt(rho^2-z.^2).*cos(t);
        y = sqrt(rho^2-z.^2).*sin(t);
        pts = [x, y, z];
    case 'fisher'
        n = N(1);
        da = N(2);
        de = N(3);
        k = N(4);
        az = circ_vmrnd(da, k, n)';
        el = circ_vmrnd(de, k, n)';
        [x, y, z] = sph2cart(az, el, rho);
        pts = [x;y;z]';
    otherwise
        pts = [0, 0, 0];
end

