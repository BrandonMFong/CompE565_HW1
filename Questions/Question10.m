% RUN SCRIPT FROM README.m

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