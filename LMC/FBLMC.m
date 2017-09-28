function thetahat = FBLMC(nablaL,proxJ,options)
% Compute FBLMC algorithm in Sub Section 6.1 of the paper. 
%
% Input:
% * nablaL: the function which performs the calculation of the gradient
% of L_\beta
% * proxJ: the function which performs the calculation of the proximal of
% J_{\beta,\lambda}
% * options.D: Analysis operator / options.Dinv: Its inverse operator 
% * options.sDtheta0: Dimension of D(theta0)
% * options.gamma: Parameter gamma in Moreau Yosida smoothing
% * options.X: Regression function / options.XT: Its adjoint operator
% * options.y: Vector of observations
% * options.beta: Temperature parameter
% * options.prior: Choice of prior
% * options.lambda, options.aSCAD (for EWA-SCAD estimator), options.mu (
% for EWA-FIRM estimator): Prior parameters
% * Linit: Initial value L_0
% * options.h: Step of discretization / options.T: Number of iterations
% 
%
% Output:
%	thetahat: EWA estimator of theta0

% Settings
gamma = options.gamma;
Linit = options.Linit; T = options.T; h = options.h; 
sDtheta0 = options.sDtheta0; Dinv = options.Dinv; 

% Initialization
if isempty(Linit) L = rand(sDtheta0); else L = Linit; end;
uhat = zeros(sDtheta0);

% Iteration
for t = 1:T
    valnablaL = nablaL(L,options);
    epsilon = sqrt(h)*randn(sDtheta0);
    L = (1-h/(2*gamma))*L + h/(2*gamma)*proxJ(L-gamma*valnablaL+epsilon,options);
    uhat = uhat + L;   
    disp_iter(t,1000);   
end

% Return thetahat
thetahat = Dinv(uhat/T);

end


