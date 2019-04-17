clear;
clc;
%ExtractFeatures();
load data;
N = length(y);
[rows, columns] = size(X);
%idx = randperm(columns);
noOfClasses = 2;
degree = 2;

% % Separate Training Data
% xTrain = X(:,idx(1:round(0.90*columns))) ; 
% yTrain = y(1,idx(1:round(0.90*columns))) ;
% 
% %Separate Testing Data 
% xTest = X(:,idx(round(0.90*columns)+1:end)) ;
% yTest =y(1,idx(round(0.90*columns)+1:end)) ;

% xDoubleHatTrain = f_TransfromFeaturesToPoly(xTrain,degree);
% xDoubleHat_Train=xDoubleHatTrain;
% xDoubleHat_Train(all(xDoubleHatTrain==1,2),:) = [];

%Normalizing
[maxVector,meanVector, normalizedX] = Normalize(X);

%Calculating wStars
w =  s_LinearRegression(normalizedX, y);
save ('w');
save ('maxVector');
save ('meanVector');

% %Normalizing Test Data
% standardX=bsxfun(@minus,xTest,meanVector);
% normalizedX=bsxfun(@rdivide,standardX,maxVector);
% 
% [yPredicted] = f_predictLR(normalizedX, w);
% E = f_missClassificationRate(yTest, yPredicted);
% disp(E);
