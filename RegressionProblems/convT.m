function res = convT(v,cfftp,signalParam) 
% Define adjoint of the operator conv

sImage = signalParam.stheta0;
res = real(ifft(fft(v).*cfftp));
res = reshape(res,sImage);
end