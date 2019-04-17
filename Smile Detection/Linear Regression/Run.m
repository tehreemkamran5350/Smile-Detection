%Main();
[MY_IMAGE MY_PATH] = uigetfile;
my_file = fullfile(MY_PATH,MY_IMAGE);
I = imread(my_file);
faceDetector = vision.CascadeObjectDetector;
BB = faceDetector(I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
end
col = round(size(BB,1)/3)+1;
title('Face Detection');
totalFace = size(BB,1); 
for i = 1:size(BB,1)
     J= imcrop(I,BB(i,:));
     figure(3),subplot(3,col,i);imshow(J);
     J = rgb2gray(J);
     features = extractLBPFeatures(J);
     Xtest= features';   
     load w;
     load meanVector;
     load maxVector;
     standardX=bsxfun(@minus,Xtest,meanVector);
     normalizedX=bsxfun(@rdivide,standardX,maxVector);
     yPredicted = f_predictLR(normalizedX,w);
     if (yPredicted==0)
        title('Smiling...');
     else
        title('Not Smiling');
     end
end
hold off;