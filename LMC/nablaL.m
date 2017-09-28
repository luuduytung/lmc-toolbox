function nL = nablaL(x,options)
% Perform the calculation of the gradient of L_\beta

X = options.X; XT = options.XT; y = options.y; beta = options.beta;

XX = @(x) XT(X(x)); Xy = XT(y);
nL = -(2/beta)*(Xy-XX(x));
end