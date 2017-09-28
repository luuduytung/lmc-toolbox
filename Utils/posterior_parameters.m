function pos_param = posterior_parameters(prior,model_param,ana_param,signal_param)
% Set posterior parameters

sigma = model_param.sigma; n = model_param.n; 
M = signal_param.M;
G = ana_param.G; L = ana_param.L; P = ana_param.P;

if (strcmpi(prior,'l1'))
    lambda = 2e2*sigma*(sqrt(G)+sqrt(4*log(L)))/sqrt(n);
    beta = 1/(n*M);
    gamma = beta;
elseif (strcmpi(prior,'firm'))
    lambda = 2e2*sigma*(sqrt(G)+sqrt(4*log(L)))/sqrt(n);
    mu = 1e3*lambda;
    beta = 1/(n*M);
    gamma = beta;
elseif (strcmpi(prior,'scad'))
    lambda = 49;
    aSCAD =  3.7;
    beta = 1/(M*n);
    gamma = beta;
elseif (strcmpi(prior,'linfty'))
    beta = 1/(n*M);
    lambda = 2*sigma*sqrt(4*log(2))*sqrt(P/n);
    gamma = beta;    
else
    error('Unknown choice of prior')
end

if (strcmpi(prior,'scad'))
    pos_param = struct('lambda',lambda,'aSCAD',aSCAD,'beta',beta,'gamma',gamma,'prior',prior);
elseif (strcmpi(prior,'firm'))
    pos_param = struct('lambda',lambda,'mu',mu,'beta',beta,'gamma',gamma,'prior',prior);
else
    pos_param = struct('lambda',lambda,'beta',beta,'gamma',gamma,'prior',prior);
end




end


