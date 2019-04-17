function ExtractFeatures()
clear;
clc;
X = [];
A =[];
B=[];
TrainImagePath = 'C:\Users\SU\Pictures\Dataset\Smiling';

for i=1:3769
    faceDetector = vision.CascadeObjectDetector;
    jpgFileName = sprintf('smile (%d).jpg', i);
    fullFileName = fullfile(TrainImagePath, jpgFileName);
    if exist(fullFileName, 'file')
        imgName = imread(fullFileName);
        newImg = imresize(imgName,[128 64]);
        BB = faceDetector(newImg);
        for k = 1 : size(BB, 1) 
            J = imcrop(newImg, BB(k, :));  
        end
        newImg = rgb2gray(J);
        features = extractLBPFeatures(newImg);
        features= features';
        A = [A features];
    end   
end
Adash = pca(A);

TrainImagePath = 'C:\Users\SU\Pictures\Dataset\Non Smiling';
for i=1:3426
    faceDetector = vision.CascadeObjectDetector;
    jpgFileName = sprintf('nonSmile (%d).jpg', i);
    fullFileName = fullfile(TrainImagePath, jpgFileName);
    if exist(fullFileName, 'file')
        imgName = imread(fullFileName);
        newImg = imresize(imgName,[128 64]);
        BB = faceDetector(newImg);
        for k = 1 : size(BB, 1) 
            J = imcrop(newImg, BB(k, :));  
        end
        newImg = rgb2gray(J);
        features = extractLBPFeatures(newImg);
        features= features';
        B = [B features];
    end   
end
Bdash = pca(B);

%X = [Adash Bdash];
X = [A B];
y = [zeros(1, size(A, 2)) ones(1, size(B,2))];
save ('data','X' ,'y');
end