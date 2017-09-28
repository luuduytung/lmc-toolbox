function p = proxJ(x,options)
% Perform the calculation of the proximal of J_{\beta,\lambda}

sDtheta0 = options.sDtheta0; G = options.G;
prior = options.prior; lambda = options.lambda;
beta = options.beta; gamma = options.gamma;

% Calculate the square norm of each group 
normgroup =  norm_group_l2(x,G);

% Calculate prox_{\gamma w_{\beta,\lambda}} of each coordinate in vector
% normgroup using Lemma 7.2 in the paper.
if strcmpi(prior,'l1')
    proxnorm = wthresh(normgroup,'s',gamma*lambda/beta);
elseif strcmpi(prior,'firm')
    proxnorm = FIRM(normgroup,options);
elseif strcmpi(prior,'linfty')
    proxnorm = normgroup-perform_l1ball_projection(normgroup,gamma*lambda/beta);
elseif strcmpi(prior,'SCAD')
    proxnorm = SCAD(normgroup,options);
end
   

% Calculate prox_{\gamma w_{\beta,\lambda}}(x) using Lemma 7.1 in the
% paper.
proxnormdivnorm = proxnorm./normgroup;
if strcmpi(prior,'linfty') % Case Linfty (non group/D = Id)
    proxnormdivnorm = reshape(proxnormdivnorm,sDtheta0);
    p = proxnormdivnorm.*x;
else
    proxnormdivnorm = reshape(proxnormdivnorm,sDtheta0(1:end-1));
    p(:,:,:,:,1) = proxnormdivnorm.*x(:,:,:,:,1);
    p(:,:,:,:,2) = proxnormdivnorm.*x(:,:,:,:,2);
end

end

function prox = SCAD(x,options)
k = options.gamma/options.beta;
lambda = options.lambda;
a = options.aSCAD;
lk = (k+1)*lambda;
la = a*lambda;
prox =   (x-k*lambda).*(x>k*lambda & x <= lk) ...
       + ((a-1)*x-k*la)/(a-1-k).*(x>lk & x<= la) ...
       + x.*(x>la);
  
end

function prox = FIRM(x,options)
alpha = options.gamma*options.lambda/options.beta;
mu = options.mu;
prox = (mu/(mu-alpha))*(x-alpha).*(x>alpha & x<=mu) + x.*(x>mu);
end