% TNM034 - ADVANCED IMAGE PROCESSING
% Isabell Jansson            isaja187
% Ronja Grosz                rongr946
% Christoffer Engelbrektsson chren574
% Jens Jakobsson             jenja698
% 2015-12-11
%------------------------------------

function FaceRegion = FindFaceRegion( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

FDetect = vision.CascadeObjectDetector;
%Returns Bounding Box values based on number of objects

% Histagram EQ
% [X, map] = rgb2ind(im, 255);
% newmap = histeq(X, map); 
% im = ind2rgb(X,newmap);


BB = step(FDetect,im);
BB = sortrows(BB, -3);
BB = BB(1,:);

% Determine image properties
[rNum, cNum, ~] = size(im);

RecEdgeX = BB(1,1)+BB(1,3)/2;
RecEdgeY = BB(1,2)+BB(1,4)/2;

% Define parameters of the rectangle
windowWidth = 0.75*BB(1,3);
windowHeight = 0.9*BB(1,4);


% Create logical mask
[yy, xx] = ndgrid((1:rNum)-RecEdgeY, (1:cNum)-RecEdgeX);
mask = xx < -windowWidth/2 | xx > windowWidth/2 | ...
    yy < -windowHeight/2 | yy > windowHeight/2;
% Mask image and show it
FaceRegion = im2double(im);
% Invert matrix
mask = ~mask;

% Return to RGB image
FaceRegion(:,:,1) = FaceRegion(:,:,1).*mask;
FaceRegion(:,:,2) = FaceRegion(:,:,2).*mask;
FaceRegion(:,:,3) = FaceRegion(:,:,3).*mask;


end

