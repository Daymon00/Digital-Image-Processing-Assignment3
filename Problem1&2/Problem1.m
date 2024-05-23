fixed_image = imread('C:\Users\MGSummer1\Desktop\MATLAB\HW3\BrainProtonDensitySliceBorder20.png');
moving_image = imread('C:\Users\MGSummer1\Desktop\MATLAB\HW3\BrainProtonDensitySliceR10X13Y17.png');
fixed_pts = [86, 99; 136, 101; 96, 159; 125, 154; 48, 128; 177, 134; 169, 89; 161, 84; 144, 58; 60, 81];
moving_pts = [106, 112; 153, 121; 104, 172; 134, 172; 62, 133; 188, 161; 187, 116; 180, 109; 169, 81; 82, 89];
xformed_image = transform(fixed_pts, moving_pts, moving_image);
figure, imshow(fixed_image), title('Fixed Image');
figure, imshow(moving_image), title('Moving Image');
figure, imshow(xformed_image), title('Transformed Moving Image');

function xformed_image = transform(fixed_pts, moving_pts, moving_image)
   centroid_fixed = mean(fixed_pts, 1);
   centroid_moving = mean(moving_pts, 1);
   translation = centroid_fixed - centroid_moving;
   xformed_image = uint8(ones(size(moving_image)) * 128);
   for y = 1:size(moving_image, 1)
       for x = 1:size(moving_image, 2)
           newX = round(x + translation(1));
           newY = round(y + translation(2));
           if newX >= 1 && newY >= 1 && newX <= size(xformed_image, 2) && newY <= size(xformed_image, 1)
               xformed_image(newY, newX) = moving_image(y, x);
           end
       end
   end
end
