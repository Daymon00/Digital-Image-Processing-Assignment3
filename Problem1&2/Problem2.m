function basicYeastCellAnalysis()
   imagePath = 'C:/Users/MGSummer1/Desktop/MATLAB/HW3/Fig1118(a).tif';
   % Grayscale
   originalImage = imread(imagePath);
   if size(originalImage, 3) == 3
       grayImage = rgb2gray(originalImage);
   else
       grayImage = originalImage;
   end
   figure, imshow(grayImage), title('1. Grayscale Image');
  
   % Averaging Filter
   kernel = ones(3, 3) / 9;
   filteredImage = conv2(double(grayImage), kernel, 'same');
   filteredImage = uint8(filteredImage);
   figure, imshow(filteredImage), title('2. Filtered Image');
  
   % Manual Thresholding
   thresholdValue = 127;
   binaryImage = filteredImage > thresholdValue;
   figure, imshow(binaryImage), title('3. Binary Image');
   totalForegroundArea = sum(binaryImage(:));
   fprintf('Foreground area in pixels: %d\n', totalForegroundArea);
end