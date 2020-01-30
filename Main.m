% HW1: Basic Digital Image Processing Operations
% Due on 03/01/2020 (11:00 pm)
% Joseph Morga & Brandon Fong
% TODO organize into the format required by Kumar

%% 1. Read and display the image using Matlab (10 points). %%

% rgbImage is a 3d matrix
rgbImage = imread('HW1\Flooded_house.jpg','jpg'); 
[rows, columns, numberOfColorChannels] = size(rgbImage);

rgbImage(:,:,1) % red component
disp('^ Red Component')
rgbImage(:,:,2) % idk component
disp('^ Green Component')
rgbImage(:,:,3) % idk component
disp('^ Blue Component')

% Display the image
figure, imshow(rgbImage);title('Original');

%% 2. Display each band (Red, Green and Blue) of the image file (15 points) %%
% Hint: Red = I[:][:][1] captures the read component of the image %
% and stores it into array Red.%%%

% I don't know if I am supposed to really the red components
% This was my first attempt:
% 
% PartArray = rgbImage(:,:,1); % Red component
% figure, imshow(PartArray);title('PartArray');

% [Sources]
% https://www.mathworks.com/matlabcentral/answers/90908-r-g-b-components-of-an-image

RedPartArray = rgbImage(:,:,1); % Red component
Red = zeros(size(RedPartArray));
RedPart = cat(3, RedPartArray, Red, Red);
figure, imshow(RedPart);title('Red');


GreenPartArray = rgbImage(:,:,2); % Green component
Green = zeros(size(GreenPartArray));
GreenPart = cat(3, Green, GreenPartArray, Green);
figure, imshow(GreenPart);title('Green');

BluePartArray = rgbImage(:,:,3); % Blue component
Blue = zeros(size(BluePartArray));
BluePart = cat(3, Blue, Blue, BluePartArray);
figure, imshow(BluePart);title('Blue');

%% 3. Convert the image into YCbCr color space: (5 points) %%

% 3.1. Matlab provides a command “rgb2ycbcr” to convert an %
% RGB image into a YCbCr image. %

ycbcr=rgb2ycbcr(rgbImage)
disp('^ RGB to YCbCr')

% 3.2. Matlab also provides a command “ycbcr2rgb” to %
% convert a YCbCr image into RGB format. %

RGBFromYCbCr=ycbcr2rgb(rgbImage)
disp('^ YCbCr to RGB')

%% 4. Display each band separately (Y, Cb and Cr bands). (10 points) %%

figure, imshow(ycbcr(:,:,1)); title('ycbcr: Y component');

figure, imshow(ycbcr(:,:,2)); title('ycbcr: Cb component');

figure, imshow(ycbcr(:,:,3)); title('ycbcr: Cr component');

%% 5. Subsample Cb and Cr bands using 4:2:0 and display both bands. (10 points) %%

% refer to tips provided in 'MATLAB Commands_ HW1.pdf'
Cb = 2; Cr = 3;

% use a for loop to access the cr and cb components and then imshow to
% Does the index start at 0?


for r = 1:rows
    for c = 1:columns
        % for every row, go through every column
        % if the row number is even OR the column is even, 
        % zero out all Cb and Cr for that index
        
        if (mod(r, 2) == 0) || (mod(c, 2) == 0) % I hope this logic makes sense
            ycbcr(r, c, Cb) = 0;
            ycbcr(r, c, Cr) = 0;
        end
    end
end

% TODO this does not look like the sample outputs
figure, imshow(ycbcr(:,:,Cb)); title('ycbcr: Cb Subsampled');
figure, imshow(ycbcr(:,:,Cr)); title('ycbcr: Cr Subsampled');


%% 6. Upsample and display the Cb and Cr bands using: (15 points) %%

% 6.1. Linear interpolation %

