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
% M-file name: Questions\Question1.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2: Display each band (Red, Green and Blue) of the image file (15 points)
% Implementation 1: Display each band
% M-file name: Questions\Question2.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 3: Convert the image into YCbCr color space: (5 points)
% Implementation 1: Conversion to YCbCr
% M-file name: Questions\Question3.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question3');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4: Display each band separately (Y, Cb and Cr bands). (10 points)
% Implementation 1: Display YCbCr
% M-file name: Questions\Question4.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question4');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5: Subsample Cb and Cr bands using 4:2:0 and display both bands. (10 points)
% Implementation 1: Subsampling 4:2:0
% M-file name: Questions\Question5.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question5');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 6: Upsample and display the Cb and Cr bands using: (15 points)
% Implementation 1: Upsample 
% M-file name: Questions\Question6.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question6');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 7: Convert the image into RGB format. (5 points)
% Implementation 1: Conversion to RGB 
% M-file name: Questions\Question7.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question7');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 8: Display the original and reconstructed images (the image restored from the YCbCr coordinate). (5 points)
% Implementation 1: Compare images
% M-file name: Questions\Question8.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question8');

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
% M-file name: Questions\Question10.m
% Usage: NA
% Location of output image: NA
% Parameters: NA
% Other parameters here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

run('Questions\Question10');

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