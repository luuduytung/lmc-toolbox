function out = sep_block(x,L,s)
% Define an operator which separates the overlapping blocks.

L2 = floor(L/2);

% Index blocks.
[dX,dY,X,Y] = ndgrid(0:L-1,0:L-1,1:L:s-L+1,1:L:s-L+1);
I1 = X+dX + (Y+dY-1)*s;
I2 = I1(:,:,1:end-1,:)+L2;
I = cat(3,I1,I2);

x1 = x(:,:,1); x2 = x(:,:,2);
out(:,:,:,:,1) = x1(I);
out(:,:,:,:,2) = x2(I);

end



