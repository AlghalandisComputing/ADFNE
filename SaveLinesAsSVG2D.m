function SaveLinesAsSVG2D(fname, lns, width, height, color, lw)
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
if nargin<5; color = '000000'; end
if nargin<4; height = 960; end
if nargin<3; width = 1280; end
[x1, y1, x2, y2] = BBoxLines2D(lns);
rx = width/(x2-x1);
ry = height/(y2-y1);
r = min(rx, ry);
lns = lns*r;
n = size(lns, 1);
svg = {
    '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
    '<svg'
    '   xmlns:dc="http://purl.org/dc/elements/1.1/"'
    '   xmlns:cc="http://creativecommons.org/ns#"'
    '   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"'
    '   xmlns:svg="http://www.w3.org/2000/svg"'
    '   xmlns="http://www.w3.org/2000/svg"'
    '   version="1.1"'
    '   id="svg2"'};
svg{end+1} = sprintf('   viewBox="%0.6f %0.6f %0.6f %0.6f"', x1*r, y1*r, x2*r, y2*r);
svg{end+1} = sprintf('   height="%dmm"', height);
svg{end+1} = sprintf('   width="%dmm">', width);
svg = [svg;...
    {'  <defs'
    '     id="defs4" />'
    '  <metadata'
    '     id="metadata7">'
    '    <rdf:RDF>'
    '      <cc:Work'
    '         rdf:about="">'
    '        <dc:format>image/svg+xml</dc:format>'
    '        <dc:type'
    '           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />'
    '        <dc:title></dc:title>'
    '      </cc:Work>'
    '    </rdf:RDF>'
    '  </metadata>'
    '  <g'
    '     id="DFN">'}];
for i=1:n
    line = lns(i, :);
    svg{i*4+25} = '    <path';
    svg{i*4+26} = sprintf('       id="path%04d"', i);
    svg{i*4+27} = sprintf('       d="M %0.6f, %0.6f %0.6f, %0.6f"', line(1), ...
                  line(2), line(3), line(4));
    svg{i*4+28} = sprintf(['       style="fill:none;fill-rule:evenodd;stroke:#%s', ...
        ';stroke-width:%dpx;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />'], ...
        color, lw);
end
svg{end+1} = '  </g>';
svg{end+1} = '</svg>';
fut = fopen(fname, 'w');
for i=1:length(svg)
    fprintf(fut, '%s\n', svg{i});
end
fclose(fut);
disp('Lines saved as SVG file.');
