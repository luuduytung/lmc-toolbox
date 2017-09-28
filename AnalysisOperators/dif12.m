function res = dif12(u,type)
% Define Dc (resp. Dr) a finite difference operators along columns (reps. 
% rows) with the corresponding transpose operators. 

    switch type
    case 'difc'
        res = u-u([1 1:end-1],:);     res(1,:) = u(1,:);
    case 'difr' 
        res = u-u(:,[1 1:end-1]);     res(:,1) = u(:,1);
    case 'difcT'
        res = u-u([2:end end],:);     res(end,:) = u(end,:);
    case 'difrT'
        res = u-u(:,[2:end end]);     res(:,end) = u(:,end);
    otherwise
        res = u;
    end
end