function [signal_param,theta0] = regression_vector(choice)
% Define regression vector

% if (strcmpi(reg_vect,'cameraman'))
%     theta0 = double(imread('cameraman.tif'));
%     theta0=theta0(35:162,65:192);
%     stheta0 = size(theta0); M = numel(theta0);
% elseif (strcmpi(reg_vect,'flat_signal'))
%     M = 100; stheta0 = [sqrt(M) sqrt(M)];
%     theta0 = create_flat_signal(M,0.05);
%     theta0 = reshape(theta0,stheta0);
% else
%     error('Unknown choice of regression vector')
% end
theta0 = choice.theta0;
reg_vect = choice.reg_vect;
stheta0 = size(theta0); M = numel(theta0);
signal_param = struct('stheta0',stheta0,'M',M,'reg_vect',reg_vect);
end

    
