function im = BestIm( imDiv, wbDiv, im, WB )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Put the vaules in an array
DivArr = [imDiv wbDiv];

% Find the value closest to 1 
[~,I] = min(abs(DivArr-1));

% The cloest value
LowestDiv = DivArr(I);

% If the closest value is from the Gray World-image then chose that image, 
% otherwise the original 
if LowestDiv == wbDiv
    im = WB;
else
    im = im2double(im);
end

end

