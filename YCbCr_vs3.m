function out = YCbCr_vs3( im )
%YCBCR_VS3 Summary of this function goes here
%   The method described in "Skin Detection and 
%   Segmentation of Human Face in Color Images"
%   can maybe improve the face detection

%--------------------------------------------------
% THIS DO NOT WORK YET!!! 15/11 - 15
%--------------------------------------------------

% Whitebalande the picture
im = whitebalance(im);

% Convert pixelvalues to doubles
im = im2double(im);

% Change the colorspace to YCbCr
YCbCr = rgb2ycbcr(im);
imshow(YCbCr)
Y = YCbCr(:,:,1);
Cb = YCbCr(:,:,2);
Cr = YCbCr(:,:,3);

%Compute the likelihood of skin

x = Cb*Cr.'; % x = (Cb,Cr)^T ????
m = mean(x); % m = E{x} (mean of x)
%C = mean((x - m) * (x - m)'); % The covariance matrix

end



