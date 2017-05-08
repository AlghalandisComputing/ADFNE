function fcm = FullCM(cm)
% FullCM
% returns full form of connectivity matrix (cm)
%
% Usage :
% fcm = FullCM(cm)
%
% input : cm sparse/matrix of connectivity
% output: fcm full matrix of cm
%
% Alghalandis Discrete Fracture Network Engineering (ADFNE)
% Author: Younes Fadakar Alghalandis
% Copyright (c) 2016 Alghalandis Computing @ http://alghalandis.net
% All rights reserved.

if issparse(cm)
    fcm = full(cm);
else
    fcm = cm;
end
fcm = fcm+fcm';
