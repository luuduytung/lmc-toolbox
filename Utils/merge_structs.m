function mSF = merge_structs(cellStructFields)
% Merge several struct fields

mSF = struct();
for i = 1:length(cellStructFields)
    mSF = setstructfields(mSF,cellStructFields{i});
end

end
