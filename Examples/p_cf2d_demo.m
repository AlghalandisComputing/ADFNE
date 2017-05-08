function p_cf2d_demo
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

% Example Applications of ADFNE:
% Connectivity Field (CF) for 2D Fracture Networks

fnm = GenFNM2D(150,0,0,0.05,0.5);                       %fracture network
La = LinesToClusters2D(fnm);                                %clustering info
gn = 20;
[CF,~,~,x,y] = ConnectivityField2D(fnm,La,gn,gn);   %CF
zcf = Resize2D(CF,3*gn,3*gn);
scf = Smooth(zcf,1);
[I,J] = size(zcf);
sx = 0:1/(J-1):1;
sy = linspace(0,1,I);
[X,Y] = LinesToXYnan2D(fnm);

clf;
set(gcf,'Colormap',hot)
subplot(221);
FNM('k-');
SET();

subplot(222);
hold on;
BLOCK();
FNM('w-');
SET();

subplot(223);
hold on;
BLOCK();
CONTOUR(0);
FNM('w-');
SET();

subplot(224);
hold on;
CONTOUR(1);
FNM('w-');
SET();

%SaveFig('CF2D_demo.png');

    function FNM(c)                                         %FNM map
        plot(X,Y,c,'LineWidth',1);                       
    end
    function BLOCK()                                        %CF block map
        imagesc(x,y,CF);                              
    end
    function CONTOUR(t)                                     %CF contour maps
        if t==0
            contour(sx,sy,scf,7,'LineColor',[0.5 0.5 0.5]);
        else
            contourf(sx,sy,scf,7);
        end
    end
    function SET()
        Titles2D('-=[');
    end
end