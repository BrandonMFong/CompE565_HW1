% RUN SCRIPT FROM README.m

%% 3.1. Matlab provides a command �rgb2ycbcr� to convert an %%

% RGB image into a YCbCr image. %

ycbcr=rgb2ycbcr(rgbImage);
% disp('^ RGB to YCbCr')

%% 3.2. Matlab also provides a command �ycbcr2rgb� to %%
% convert a YCbCr image into RGB format. %

RGBFromYCbCr=ycbcr2rgb(ycbcr); %Shouldn't be ycbrc instead of rgbImage? Yes oops lol
% disp('^ YCbCr to RGB')