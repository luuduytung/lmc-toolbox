function thetahat = semiFBLMC(nablaL,proxJ,options)
% Compute semiFBLMC algorithm in Sub Section 6.2 of the paper. 
%
% Input:
% * nablaL: the function which performs the calculation of the gradient
% of L_\beta.
% * proxJ: the function which performs the calculation of the proximal of
% J_{\beta,\lambda}.
% * options.stheta0: Dimension of theta0
% * options.D: Analysis operator / options.DT: Its adjoint operator
% * options.sDtheta0: Dimension of D(theta0)
% * options.gamma: Parameter gamma in Moreau Yosida smoothing
% * options.X: Regression function / options.XT: Its adjoint operator
% * options.y: Vector of observations
% * options.beta: Temperature parafmeter
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
stheta0 = options.stheta0; 
Linit = options.Linit; gamma = options.gamma; h = options.h; T = options.T; 
D = options.D; DT = options.DT; 

% Initialization
if isempty(Linit) L = rand(stheta0); else L = Linit; end;
uhat = zeros(stheta0);

% Iteration
for t = 1:T
    DL = D(L);
    valnablaL = nablaL(L,options);
    epsilon = sqrt(2*h)*randn(stheta0);
    L = L-h*valnablaL-(h/gamma)*DT(DL-proxJ(DL,options))+epsilon;
    uhat = uhat + L;    
    disp_iter(t,1000);        
end

% Return thetahat
thetahat = uhat/T;
end



