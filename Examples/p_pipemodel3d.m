% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

% Example Applications of ADFNE:
% Pipe Model of 3D Fracture Networks

clear all; clc

tic
fnm = GenFNM3DE5(100, Rad(45), Rad(45), Rad(180), Rad(180), [], 0.2);
toc
tic
[pip, cas, cts, xts, ids, La] = FNMPipes3D(fnm); %pipes, clusters
toc
c = Colorise(cas);
mc = max(cas);                                   %largest cluster

%%
clf
%subplot(121);                                   %fnm
%ShowFNM(fnm, Relabel(La));
%DrawPolys3D(fnm, Relabel(La), [0, 0, 0, 1], true);
%subplot(122);                                   %pipe model
hold on
for i=1:size(pip, 1)
    if cas(i)==mc
        fc = 'r';
        al = 1;
    else
        fc = [0.7, 0.7, 0.7];
        al = 0.3;
    end
    drawCylinder([pip(i, :), 0.004], 16, 'FaceColor', fc, 'FaceAlpha', al);
end
light('Position', [-1, -1, 1]);
SetAxes3D();
%FullScreen();
%SaveFig('PipeModel.png');

%%
if 0
    clf
    DrawPolys3D(fnm, [], [1,0.7,0.4,1], true);
    light('Position', [-1, -1, 2]);
    SaveFig('fnm2000_.png');
    
    %%
    clf
    hold on
    for i=1:size(pip, 1)
        drawCylinder([pip(i, :), 0.004], 16, 'FaceColor', ...
            [1,0.7,0.4], 'FaceAlpha', 1);
    end
    light('Position', [-1, -1, 2]);
    SetAxes3D();
    SaveFig('fnm2000_pipes.png');
end
