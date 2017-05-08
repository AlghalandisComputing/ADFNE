function [f, x, pd] = Histo(X, nb, tl, xl, yl, fc, ec, fm, es, pc, fit)
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

if nargin<11; fit = ''; end
if (nargin<10) || isempty(pc); pc = 5; end;
if (nargin<9) || isempty(es); es = 1; end;
if (nargin<8) || isempty(fm); fm = '%g'; end;
if (nargin<7) || isempty(ec); ec = 'w'; end;
if (nargin<6) || isempty(fc); fc = [0, 0.5, 0.5]; end;
if (nargin<5) || isempty(yl); yl = 'f (frequency)'; end;
if (nargin<4) || isempty(xl); xl = 'x (variable)'; end;
if (nargin<3) || isempty(tl); tl = 'Histogram'; end;
if nargin<2; nb = 15; end;
y = reshape(X, 1, []);
y = y(~isnan(y));
if all(FixZero(diff(y))==0)  %y has only one value
    f = zeros(1, nb);
    x = linspace(0, 1, nb);
    f(round(nb/2)) = numel(y);
    xt = zeros(1, nb)+y(1);
else
    [f, x] = hist(y, nb);
    xt = x;
end
hh = bar(x, f, 1);
h = findobj(gca, 'Type', 'patch');
set(h, 'FaceColor', fc, 'EdgeColor', ec);
xlabel(xl);
ylabel(yl);
if strcmp(tl, 'Histogram') || strfind(tl, ':')
    [n, m, s, ~, ~, ~] = Statistics(y);
    tl = [tl, ' $$\{n=', num2str(n), ',  \mu=', num2str(m, '%0.3f'), ...
        ',  \sigma=', num2str(s, '%0.3f'), '\}$$'];
    title(tl, 'Interpreter', 'latex');
else
    title(tl);
end
box on;
EAxes(pc);
%axis tight;
%bbox = axis;
%dx = (bbox(2)-bbox(1))*pc;
%dy = (bbox(4)-bbox(3))*pc;
%axis(bbox+[-dx, dx, -dy, dy]);
set(gca, 'XTick', x);
L = cell(0);
i = 0;
while i<nb
    i = i+1;
    L{i} = num2str(xt(i), fm);
    for j=1:es
        i = i+1;
        L{i} = '';
    end
end
set(gca, 'XTickLabel', L);
%fit = {'Normal', '-', 2}
if ~isempty(fit)
    pd = fitdist(y', fit{1});
    q = icdf(pd, [0.0013499, 0.99865]);
    x = linspace(q(1), q(2));
    xd = get(hh, 'Xdata');
    area = numel(y)*(max(xd(:))-min(xd(:)))/nb;
    y = area*pdf(pd, x);
    hold on; plot(x, y, fit{2}, 'LineWidth', fit{3});
else
    pd = NaN;
end
