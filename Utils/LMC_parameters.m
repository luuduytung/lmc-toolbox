function LMC_param = LMC_parameters(nb_it,Linit,model_param,pos_param)
% Set LMC parameters

if (mod(nb_it,1)~=0) || (nb_it<=0)
    error('Number of iterations must be a positive integer')
end

reg_fun = model_param.reg_fun;
beta = pos_param.beta;

if (strcmpi(reg_fun,'Inpainting'))
    h = beta*5e-3;
elseif (strcmpi(reg_fun,'Deconvolution'))
    h = beta*5e-6;
elseif (strcmpi(reg_fun,'compressed_sensing'))
    h = beta*5e-2;
else
    h = beta*5e-2;
end
LMC_param = struct('h',h,'T',nb_it,'Linit',Linit);

end