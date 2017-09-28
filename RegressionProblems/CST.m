function res = CST(x,matX,signalParam)
% Define adjoint of the operator CS

    res = reshape(matX'*x(:),signalParam.stheta0);
end