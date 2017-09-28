function res = mask(image,maskPositions) 
% Define operator of inpainting

    res = image(:);
    res(maskPositions)=[];
end