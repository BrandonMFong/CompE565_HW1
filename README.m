% HW1: Basic Digital Image Processing Operations
% Due on 03/01/2020 (11:00 pm)
% Joseph Morga & Brandon Fong
% CompE 565 Homework 1
% Due Date: 2/23/2020, 11:00 pm
% Name & ID : Joseph Morga (<TODO Joseph's REDid>), Brandon Fong (819295224)
% email: <TODO Joseph's email>, fong.m.brandon97@gmail.com
% Link to Report: https://docs.google.com/document/d/1ara71pG_QNAmNXtZ8pAItMp23dw9SC7Hg4MwwOjM3XM/edit?usp=sharing

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

RGBFromYCbCr=ycbcr2rgb(ycbcr); %Shouldn't be ycbrc instead of rgbImage? Yes oops lol
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
%         for every row, go through every column
%         if the row number is even OR the column is even, 
%         zero out all Cb and Cr for that index
%         
%         if (mod(r, 2) == 0) || (mod(c, 2) == 0) % I hope this logic makes sense
%             ycbcrSubsampled(r, c, Cb) = 128;
%             ycbcrSubsampled(r, c, Cr) = 128;
%             I put 128 because when I orignally put 0, ycbcrSubsampled
%             had 128 values and zeroes for the rest
%             the image looks closer to the original image
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


% figure, imshow(ycbcrReconstructed); title('[6.1] Reconstructed'); %Just to see what Im getting
% figure, imshow(ycbcr); title('Original'); %Original


%% 6.2. Simple row or column replication. %%
% using ycbcrSubsampled

ycbcrReconstructed62 = luma; % init just to ensure dimensions           %Changed this two lines :)
ycbcrReconstructed62(1:2:end,1:2:end,Cb:Cr) = ycbcrSubsampled(:,:,Cb:Cr);

% ycbcrReconstructed62 = ycbcrSubsampled; % init just to ensure dimensions

% figure, imshow(ycbcrReconstructed62); title('[6.2] Before reconstruction');

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

% figure, imshow(ycbcrReconstructed62); title('[6.2] Reconstructed');

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

% figure, imshow(RGBreconstructed); title('[8.1] Reconstructed (Interpolation)');
% 
% figure, imshow(ycbcrReconstructed62); title('[8.2] Reconstructed (Replication)');
% 
% figure, imshow(rgbImage); title('Original');

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

% 6.2
% The upsampled image using replication seems to be visually identical to
% the orinial image.  There about 500 rows and 700 columns, so essentially
% 250 rows and 350 columns are replicates of its former.  The discrepency
% most likely cannot be seen because of the resolution and the image.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 10:    Measure MSE between the original and reconstructed images (obtained 
%               using linear interpolation only). Comment on the results. (10 points)
% Implementation 1: MSE
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Only analyze 6.1
% Redefining variables for clarity
Original = rgbImage;
ycbcrOriginal = rgb2ycbcr(Original);
[rowsOriginal, columnsOriginal, numColOG] = size(Original);
[rowsReconstructed, columnsReconstructed, numColRec] = size(ycbcrReconstructed);
temp = 0;MSE = 0; %not a matrix
red = 1; green = 2; blue = 3; Y = 1; Cb = 2; Cr = 3;
component = Y;

% Hmmmm, these are obviously not the same but the MSE equation says they
% are
% figure, imshow(ycbcrOriginal); title('ycbcrOriginal');
% figure, imshow(ycbcrReconstructed); title('ycbcrReconstructed');
% 
% figure, imshow(Original); title('Original');
% figure, imshow(RGBreconstructed); title('RGBreconstructed');

if (rowsOriginal == rowsReconstructed) && (columnsOriginal == columnsReconstructed)
%     for r = 1:rowsOriginal
%         for c = 1:columnsOriginal
%             temp = ycbcrOriginal(r, c, component);
%             ycbcrReconstructed(r, c, component);
%             temp = temp - ycbcrReconstructed(r, c, component);
%             temp = temp.^2;
%             MSE = MSE + temp;
%             %temp = 0;
%         end
%     end
%     MSE = (1/(row*col))*MSE
% https://www.mathworks.com/matlabcentral/answers/81048-mse-mean-square-error
    MSEY = mean(mean((ycbcrOriginal-ycbcrReconstructed).^2)); %YCBCR
    MSERGB = mean(mean((Original-RGBreconstructed).^2)); % RGB
else
    fprintf('Dimensions are wrong, please review code')
end

% fprintf('MSE calculations are complete. MSE = %f', (MSE(:,:,1)+MSE(:,:,2)+MSE(:,:,3)));
fprintf('MSE calculations are complete.\n');
fprintf('MSE (Red): %f\n',(MSERGB(:,:,red)));
fprintf('MSE (Green): %f\n',(MSERGB(:,:,green)));
fprintf('MSE (Blue): %f\n',(MSERGB(:,:,blue)));
fprintf('MSE (Y): %f\n',(MSEY(:,:,Y)));

% Comments on results
% We have displayed the MSE values for each RGB component and the y
% component.  The greatest error that we have received was the Red
% component.  The rest are pretty low and are good for our algorithms.
% Especially the Y component has a value of 0.  

% This gives the error with the matlab function immse()
% err = immse(RGBreconstructed,Original)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 10:   Comment on the compression ratio achieved by subsampling 
%               Cb and Cr components for 4:2:0 approach. Please note that 
%               you do not send the pixels which are made zero in the row 
%               and columns during subsampling. (5 points)
% Implementation 1: Comment on compression ratio
% M-file name: NA
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comments on ratio
% When we upsampled the subsampled 4:2:0 array, we were able to achieve the
% original image.  The reconstructed image visually looks identical,
% however the MSE shows otherwise.  Not knowing what the original Cb and Cr
% component values were, we have the ability of sending the 4:2:0 image
% through a network and rely on an algorithm to reconstruct it.  With the
% decrease in file size, the comopressed image can be transmitted at a
% higher rate.  