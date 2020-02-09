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