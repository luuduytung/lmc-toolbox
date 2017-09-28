function modelParam = create_model(theta0,X,XT,reg_fun)
% Construct the linear regression model
%                       Y = X(\theta_0) + \xi
% where X is the regression function and \xi i.i.d. ~ \mathcal N(0,\sigma^2)
% with the noise level \sigma is chosen according to \theta_0 through the 
% signal-to-noise ratio.

Xtheta0 = X(theta0); n = numel(Xtheta0);
snr = 10;
sigma = norm(Xtheta0)*10^(-snr/10)/n;
epsilon = sigma*randn(size(Xtheta0));
y = Xtheta0 + epsilon;
modelParam = struct('n',n,'X',X,'XT',XT,'y',y,'sigma',sigma,'reg_fun',reg_fun);

end