function out = Backbone(in,tol)
    % Backbone
    % create backbone structure of 2D/3D fracture network
    %
    % Usage :
    % out = Backbone(in,tol)
    %
    % input : in        |Pipes|
    %         tol       (1):tolerance|1e-9
    % output: out       |Backbone,Mask,Types,Fid,Apertures,Depths|
    %
    % Alghalandis Discrete Fracture Network Engineering (ADFNE)
    % Author: Younes Fadakar Alghalandis
    % Copyright (c) 2017 Alghalandis Computing @ http://alghalandis.net
    % All rights reserved.
    
    ac.Tool.TicToc('Backbone');
    if nargin < 2; tol = 1e-9; end
    pip = in.Pipes;
    b = false(size(pip,1),1);                                                        % mask
    while true                                                                       % iterative check
        c = ac.IsolatedLines(pip(~b,:),tol);                                         % isolated ones
        if ~any(c); break; end                                                       % all done?
        b(~b) = c;
    end
    f = (in.Types == -9);                                                            % island clusters
    b = (~b & ~f);
    out.Backbone = pip(b,:);
    out.Mask = b;
    out.Types = in.Types(out.Mask);
    out.Fid = in.Fid(b);
    out.Apertures = in.Apertures(b);
    if size(pip,2) == 6                                                              % if 3D
        lth = repelem(in.fnm.xLengths,2);
        xlh = lth(b);                                                                % intersection length=depth
    else
        xlh = 1;
    end
    out.Depths = xlh;
    ac.Tool.TicToc;
end
