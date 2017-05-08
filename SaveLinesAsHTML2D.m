function SaveLinesAsHTML2D(fname, lns, width, height, color, lw)
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

if nargin<6; lw = 1; end
if nargin<5; color = [0, 0, 0]; end
if nargin<4; height = 960; end
if nargin<3; width = 1280; end
[x1, y1, x2, y2] = BBoxLines2D(lns);
rx = width/(x2-x1);
ry = height/(y2-y1);
r = min(rx, ry);
lns = lns*r;
n = size(lns, 1);
htm = {...
    '<!DOCTYPE html>'
    '<html>'
    '<head><title>ADFN Output</title></head>'
    '<body>'
    sprintf('    <canvas id=''canvas'' width=''%d'' height=''%d''></canvas>', width, height)
    '    <script>'
    '    var Ink = document.getElementById("canvas").getContext("2d");'
    '//#layer1'};
for i=1:n
    line = lns(i, :);
    htm{i*9} = sprintf('//#path%04d', i);
    htm{i*9+1} = '    Ink.beginPath();';
    htm{i*9+2} = '    Ink.lineJoin = ''miter'';';
    htm{i*9+3} = sprintf('    Ink.strokeStyle = ''rgb(%d,  %d,  %d)'';', ...
        color(1), color(2), color(3));
    htm{i*9+4} = '    Ink.lineCap = ''butt'';';
    htm{i*9+5} = sprintf('    Ink.lineWidth = %0.6f;', lw);
    htm{i*9+6} = sprintf('    Ink.moveTo(%0.6f,  %0.6f);', line(1), line(2));
    htm{i*9+7} = sprintf('    Ink.lineTo(%0.6f,  %0.6f);', line(3), line(4));
    htm{i*9+8} = '    Ink.stroke();';
end
htm{end+1} = '    </script>';
htm{end+1} = '</body>';
htm{end+1} = '</html>';
fut = fopen(fname, 'w');
for i=1:length(htm)
    fprintf(fut, '%s\n', htm{i});
end
fclose(fut);
disp('Lines saved as HTML file.');
