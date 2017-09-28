function out = sep_blockT(x,L,s)
% Define adjoint of the operator sep_block.

L2 = floor(L/2); sL = floor(s/L);
[dX,dY,X,Y] = ndgrid(0:L-1,0:L-1,1:L:s-L+1,1:L:s-L+1);
I1 = X+dX + (Y+dY-1)*s;
I2 = I1(:,:,1:end-1,:)+L2;

out1 = zeros(s,s); out1(I1) = x(:,:,1:sL,:,1); out1(I2) = out1(I2)+x(:,:,sL+1:end,:,1);
out2 = zeros(s,s); out2(I1) = x(:,:,1:sL,:,2); out2(I2) = out2(I2)+x(:,:,sL+1:end,:,2);
out(:,:,1) = out1; out(:,:,2) = out2;

end




