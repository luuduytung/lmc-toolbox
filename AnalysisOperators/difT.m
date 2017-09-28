function res = difT(Pxy)
% Define adjoint of the operator dif.

   res = RT(dT(Pxy));
end

function res =  dT(Pxy)
    res(:,:,1) = dif12(Pxy(:,:,1),'difcT');     
    res(:,:,2) = dif12(Pxy(:,:,2),'difrT');
end

function res =  RT(Pxy)
    res = Pxy(:,:,1) + Pxy(:,:,2);
end