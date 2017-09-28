function res = maskT(v,maskPositions,signalParam)
% Define adjoint of the operator mask

    numImage = signalParam.M; sImage = signalParam.stheta0;
    
    res = zeros(numImage,1);    
    res(setdiff(1:end,maskPositions)) = v;
    res = reshape(res,sImage);
end