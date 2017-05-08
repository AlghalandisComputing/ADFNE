function [time, ebal, edamp, eel, einel, ekin, evol] = LoadElfenResults(files)
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

s = '_energy_';
[t1, ebal] = ImportElfenGRF([files, s, 'e_bal.grf']);
[t2, edamp] = ImportElfenGRF([files, s, 'e_damp.grf']);
[t3, eel] = ImportElfenGRF([files, s, 'e_el.grf']);
[t4, einel] = ImportElfenGRF([files, s, 'e_inel.grf']);
[t5, ekin] = ImportElfenGRF([files, s, 'e_kin.grf']);
[t6, evol] = ImportElfenGRF([files, s, 'volume.grf']);
if ~isnan(t1)
    time = t1;
elseif ~isnan(t2)
    time = t2;
elseif ~isnan(t3)
    time = t3;
elseif ~isnan(t4)
    time = t4;
elseif ~isnan(t5)
    time = t5;
elseif ~isnan(t6)
    time = t6;
end
if isnan(ebal); ebal = nan(size(time)); end
if isnan(edamp); edamp = nan(size(time)); end
if isnan(eel); eel = nan(size(time)); end
if isnan(einel); einel = nan(size(time)); end
if isnan(ekin); ekin = nan(size(time)); end
if isnan(evol); evol = nan(size(time)); end
