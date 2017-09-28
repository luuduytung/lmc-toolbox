function [X,XT] = regression_function(reg_fun,signal_param,ana_param)
% Define regression function

M = signal_param.M; P = ana_param.P;
if (strcmpi(reg_fun,'inpainting'))
    percent = 20; n = floor(M*percent/100);
    mask_positions = randperm(M,n);
    X = @(x) mask(x,mask_positions);   XT = @(x) maskT(x,mask_positions,signal_param);
elseif (strcmpi(reg_fun,'compressed_sensing'))
     n = 9*M/16; 
     matX = 2*round(rand(n,M))-1;    
     matX = matX/100;
     X = @(x) CS(x,matX); XT = @(x) CST(x,matX,signal_param); 
elseif (strcmpi(reg_fun,'compressed_sensing_overdeterminded'))
    n = round(4*M/3); 
    matX = 2*round(rand(n,M))-1;    
    matX = matX/P;
    X = @(x) CS(x,matX); XT = @(x) CST(x,matX,signal_param); 
elseif (strcmpi(reg_fun,'deconvolution'))
    param = 1;
    p = fftshift(exp(-[-M/2:M/2-1].^2/(2*param^2)))';
    p = exp(-[-M/2:M/2-1].^2/(2*param^2))';
    p = p/norm(p(:))*sqrt(M);
    fftp = fft(p); cfftp = conj(fftp);
    X = @(x) conv(x,fftp); XT = @(x) convT(x,cfftp,signal_param);
else
    error('Unknown choice of regression function')
end


end
    