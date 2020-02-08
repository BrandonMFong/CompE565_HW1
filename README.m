% HW1: Basic Digital Image Processing Operations
% Due on 03/01/2020 (11:00 pm)
% Joseph Morga & Brandon Fong
% TODO organize into the format required by Kumar
% CompE 565 Homework 1
% Due Date: 2/23/2020, 11:00 pm
% Name & ID : Joseph Morga (<TODO Joseph's REDid>), Brandon Fong (819295224)
% email: <TODO Joseph's email>, fong.m.brandon97@gmail.com

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1: Read and display the image using Matlab (10 points)
% Implementation 1: Display
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% rgbImage is a 3d matrix
rgbImage = imread('Flooded_house.jpg','jpg');            %Changed path so that
[rows, columns, numberOfColorChannels] = size(rgbImage); %my computer would not
                                                         %give me erros
                                                         %when running the
                                                         %script

rgbImage(:,:,1); % red component
% disp('^ Red Component');
rgbImage(:,:,2); % idk component
% disp('^ Green Component');
rgbImage(:,:,3); % idk component
% disp('^ Blue Component');

% Display the image
% figure, imshow(rgbImage);title('Original');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2: Display each band (Red, Green and Blue) of the image file (15 points)
% Implementation 1: Display each band
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
% figure, imshow(RedPart);title('Red');


GreenPartArray = rgbImage(:,:,2); % Green component
Green = zeros(size(GreenPartArray));
GreenPart = cat(3, Green, GreenPartArray, Green);
% figure, imshow(GreenPart);title('Green');

BluePartArray = rgbImage(:,:,3); % Blue component
Blue = zeros(size(BluePartArray));
BluePart = cat(3, Blue, Blue, BluePartArray);
% figure, imshow(BluePart);title('Blue');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3: Convert the image into YCbCr color space: (5 points)
% Implementation 1: Conversion to YCbCr
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 3.1. Matlab provides a command �rgb2ycbcr� to convert an %%

% RGB image into a YCbCr image. %

ycbcr=rgb2ycbcr(rgbImage);
% disp('^ RGB to YCbCr')

%% 3.2. Matlab also provides a command �ycbcr2rgb� to %%
% convert a YCbCr image into RGB format. %

RGBFromYCbCr=ycbcr2rgb(rgbImage); %Shouldn't be ycbrc instead of rgbImage?
% disp('^ YCbCr to RGB')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4: Display each band separately (Y, Cb and Cr bands). (10 points)
% Implementation 1: Display YCbCr
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure, imshow(ycbcr(:,:,1)); title('ycbcr: Y component');
% 
% figure, imshow(ycbcr(:,:,2)); title('ycbcr: Cb component');
% 
% figure, imshow(ycbcr(:,:,3)); title('ycbcr: Cr component');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5: Subsample Cb and Cr bands using 4:2:0 and display both bands. (10 points)
% Implementation 1: Subsampling 4:2:0
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% refer to tips provided in 'MATLAB Commands_ HW1.pdf'
Y = 1; Cb = 2; Cr = 3;

% use a for loop to access the cr and cb components and then imshow to
% Does the index start at 0? It starts at index 1

% Setting an ycbcr var to work with 
% ycbcrSubsampled=rgb2ycbcr(rgbImage);


% for r = 1:rows
%     for c = 1:columns
%         % for every row, go through every column
%         % if the row number is even OR the column is even, 
%         % zero out all Cb and Cr for that index
%         
%         if (mod(r, 2) == 0) || (mod(c, 2) == 0) % I hope this logic makes sense
%             ycbcrSubsampled(r, c, Cb) = 128;
%             ycbcrSubsampled(r, c, Cr) = 128;
%             % I put 128 because when I orignally put 0, ycbcrSubsampled
%             % had 128 values and zeroes for the rest
%             % the image looks closer to the original image
%         end
%     end
% end

%I dont think we are supposed to zero out all even rows and columns,
%I understood that we have to remove them.
%I think I removed it by equating it to 128

%Are we not supposed to reduce the dimensions so that an NxM matrix becomes
%an (N/2)x(M/2) matrix
%I think by equating the pixels to 128, we are only changing the value of
%of that pixel to 128 instead of removing it.



%Copying all odd rows and columns from ycbcr into matrix ycbcrSubsampled

ycbcrSubsampled(:,:,Cb:Cr) = ycbcr(1:2:end,1:2:end,Cb:Cr);  
                                               
luma(:,:,Y) = ycbcr(:,:,Y);        %After doing this the subsampled
                                   %images look like the original ones
                                   %but smaller
                                       

% Display
% figure, imshow(ycbcrSubsampled(:,:,Cb)); title('ycbcr: Cb Subsampled');
% figure, imshow(ycbcrSubsampled(:,:,Cr)); title('ycbcr: Cr Subsampled');
% ycbcrSubsampled(:,:,Y)
% ycbcrSubsampled(:,:,Cb)
% ycbcrSubsampled(:,:,Cr)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 6: Upsample and display the Cb and Cr bands using: (15 points)
% Implementation 1: Upsample 
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 6.1. Linear interpolation %%

% For odd row, compute the missing pixel as an average of the
% pixels in its right and left sides.

% For even rows, compute the missing pixel as an average of the
% pixels in its top and bottom sides.

ycbcrReconstructed = luma(:,:,Y);
ycbcrReconstructed(1:2:end,1:2:end,Cb:Cr) = ycbcrSubsampled(:,:,Cb:Cr);

%Calculating even pixels of odd rows
oddPixelRows = (ycbcrSubsampled(:,1:1:end-1,Cb:Cr) + ycbcrSubsampled(:,2:1:end,Cb:Cr))/2;

[lumaRows, lumaColumns] = size(luma);

if(mod(lumaColumns, 2) == 0)
    ycbcrReconstructed(1:2:end,2:2:end-1,Cb:Cr) = oddPixelRows(:,:,Cb-1:Cr-1);
else
    ycbcrReconstructed(1:2:end,2:2:end,Cb:Cr) = oddPixelRows(:,:,Cb-1:Cr-1);
end

if(mod(lumaRows, 2) == 0)
    ycbcrReconstructed(2:2:end-1,:,Cb:Cr) = (ycbcrReconstructed(1:2:end-2,:,Cb:Cr) + ycbcrReconstructed(3:2:end,:,Cb:Cr))/2;
else
    ycbcrReconstructed(2:2:end-1,:,Cb:Cr) = (ycbcrReconstructed(1:2:end-2,:,Cb:Cr) + ycbcrReconstructed(3:2:end,:,Cb:Cr))/2;
end

if(mod(lumaColumns, 2) == 0)
    ycbcrReconstructed(:,end,Cb:Cr) = ycbcrReconstructed(:,end-1,Cb:Cr);
end

if(mod(lumaRows, 2) == 0)
    ycbcrReconstructed(end,:,Cb:Cr) = ycbcrReconstructed(end-1,:,Cb:Cr);
end


figure, imshow(ycbcrReconstructed); title('[6.1] Reconstructed'); %Just to see what Im getting
figure, imshow(ycbcr); title('Original'); %Original


%% 6.2. Simple row or column replication. %%
% using ycbcrSubsampled

ycbcrReconstructed62 = luma; % init just to ensure dimensions           %Changed this two lines :)
ycbcrReconstructed62(1:2:end,1:2:end,Cb:Cr) = ycbcrSubsampled(:,:,Cb:Cr);

figure, imshow(ycbcrReconstructed62); title('[6.2] Before reconstruction');

for r = 1:rows
    for c = 1:columns
        % if we are in an odd row and it's an even column
        if ((mod(c, 2) == 0) && mod(r, 2) ~= 0)
            % copying the value from the column before index
            ycbcrReconstructed62(r,c,Cr) = ycbcrReconstructed62(r,c-1,Cr);
            ycbcrReconstructed62(r,c,Cb) = ycbcrReconstructed62(r,c-1,Cb);
        % if it is an even row
        elseif (mod(r, 2) == 0)
            % copies the entire previous row
            ycbcrReconstructed62(r,:,Cr) = ycbcrReconstructed62(r-1,:,Cr);
            ycbcrReconstructed62(r,:,Cb) = ycbcrReconstructed62(r-1,:,Cb);
        end
    end
end

figure, imshow(ycbcrReconstructed62); title('[6.2] Reconstructed');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 7: Convert the image into RGB format. (5 points)
% Implementation 1: Conversion to RGB 
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert the values from 6.1
RGBreconstructed = ycbcr2rgb(ycbcrReconstructed);

% Convert the values from 6.2
ycbcrReconstructed62=ycbcr2rgb(ycbcrReconstructed62); % convert back to RGB

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 8: Display the original and reconstructed images (the image restored from the YCbCr coordinate). (5 points)
% Implementation 1: Compare images
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure, imshow(RGBreconstructed); title('[8.1] Reconstructed');% TODO put reconstructed var from 6.1

figure, imshow(ycbcrReconstructed62); title('[8.2] Reconstructed');

figure, imshow(rgbImage); title('Original');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 9: Comment on the visual quality of the reconstructed image for both the upsampling cases. (5 points)
% Implementation 1: Comment
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TODO wait for 6.1 and 6.2 to finish then evaluate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 9:    Measure MSE between the original and reconstructed images (obtained 
%               using linear interpolation only). Comment on the results. (10 points)
% Implementation 1: MSE
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
