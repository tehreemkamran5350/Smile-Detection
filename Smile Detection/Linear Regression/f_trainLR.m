function w = f_trainLR(XTrain,yTrain,lambda)
    X = [ones(1,size(XTrain,2)); XTrain]; 
    y = yTrain';    
    d = size(X,1);
    w = (X*X'+lambda*eye(d))\(X*y);
end