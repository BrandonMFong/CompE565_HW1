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
