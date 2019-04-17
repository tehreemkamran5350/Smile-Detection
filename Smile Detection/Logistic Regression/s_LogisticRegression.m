function wStar = s_LinearRegression(X, y)
idx = randperm(length(y));
X = X(:,idx); y = y(idx);
numFolds = 10;
crossValidationPartitions = f_getCrossValidationSets(X,y,numFolds);
lambdaz = 0:0.1:2;
EOuts=[];
for j = 1:length(lambdaz)
    lambda = lambdaz(j);
    eTest = [];
    for k = 1:numFolds
        D = crossValidationPartitions{k};        
        w = f_trainLogisticR(D.XTrain,D.yTrain,lambda);
        yPredicted = f_predictLogisticR(D.XTest,w);
        eTest(k) = f_missClassificationRate(D.yTest,yPredicted);
    end
    EOuts(j) = mean(eTest);    
end
%plot(lambdaz,EOuts);
[minEOut,idx] = min(EOuts);
bestLambda = lambdaz(idx);
wStar = f_trainLogisticR(X,y,bestLambda); %deploy this
end

