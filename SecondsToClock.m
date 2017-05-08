function clk = SecondsToClock(snd)
% SecondsToClock
% converts seconds to clock format as string
%
% Usage :
% clk = SecondsToClock(snd)
%
% input : snd       seconds
% output: clk       clock string
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

h = floor(snd/3600);
m = floor((snd-(h*3600))/60);
s = rem(snd, 3600)-m*60;
clk = sprintf('%02d:%02d:%05.2f', h, m, s);
