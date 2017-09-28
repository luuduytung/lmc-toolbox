function res = conv(image,fftp) 
% Define operator of convolution

    res = image(:);
    res = real(ifft(fft(res).*fftp));

end