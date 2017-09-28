function res = norm_group_l2(u,G)
% Calculate the square norm of each group in u

if (G==1) 
    % Non group
    res = abs(u);
elseif (G==2)
    % Group
    res =  sqrt(u(:,:,:,:,1).^2+u(:,:,:,:,2).^2);
else
    error('Size of groups must equal 1 or 2')
end
% Vectorization
res = res(:);
end
