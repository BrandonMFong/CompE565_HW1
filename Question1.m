% rgbImage is a 3d matrix
rgbImage = imread('Flooded_house.jpg','jpg');            %Changed path so that
[rows, columns, numberOfColorChannels] = size(rgbImage); %my computer would not
                                                         %give me erros
                                                         %when running the
                                                         %script

rgbImage(:,:,1) % red component
% disp('^ Red Component');
rgbImage(:,:,2); % idk component
% disp('^ Green Component');
rgbImage(:,:,3); % idk component
% disp('^ Blue Component');

% Display the image
% figure, imshow(rgbImage);title('Original');