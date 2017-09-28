function res = dif(u)
% Define a finite difference operator along columns and rows.

    res = d(R(u));
end

function res = d(Pxy)
    res(:,:,1) = dif12(Pxy(:,:,1),'difc'); 
    res(:,:,2) = dif12(Pxy(:,:,2),'difr');
end

function res = R(u)
    res(:,:,1) = u; res(:,:,2) = u;
end
