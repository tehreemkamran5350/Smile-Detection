function crossValidationPartitions = f_getCrossValidationSets(X,y,numFolds)
    partitionSize = round(size(X,2)/numFolds);
    for i = 1:numFolds
       idx = false(size(y));
       if i<numFolds
            idx((i-1)*partitionSize+1:i*partitionSize) = true;
       else
           idx((i-1)*partitionSize+1:end) = true;
       end              
       D.XTest = X(:,idx);
       D.yTest = y(idx);
       D.XTrain = X(:,~idx);
       D.yTrain = y(~idx);
       crossValidationPartitions{i} = D;
    end
end